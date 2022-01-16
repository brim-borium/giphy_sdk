package de.minimalme.giphy_sdk

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Context
import android.util.Log
import androidx.annotation.NonNull
import androidx.fragment.app.FragmentActivity
import com.giphy.sdk.core.models.Media
import com.giphy.sdk.ui.GPHContentType
import com.giphy.sdk.ui.GPHSettings
import com.giphy.sdk.ui.themes.GPHTheme
import com.giphy.sdk.ui.themes.GridType
import com.giphy.sdk.ui.views.GiphyDialogFragment
import com.google.gson.Gson
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.lang.Exception
import java.util.*
import kotlin.collections.ArrayList
import kotlin.collections.HashMap


/** GiphySdkPlugin */
class GiphySdkPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity

  /// application context
  private var applicationActivity: Activity? = null

  /// method channel
  private lateinit var channel: MethodChannel
  private val channelName = "giphy_sdk"
  private val loggingTag = "giphy_sdk"

  /// connecting
  private val methodOpenGiphySelection = "openGiphySelection"

  /// parameters
  private val paramApiKey = "apiKey"
  private val paramGiphySettings = "giphySettings"

  /// errors
  private val errorConnecting = "errorConnecting"
  private val errorMappingGiphySettings = "errorMappingGiphySettings"

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "giphy_sdk")
    channel.setMethodCallHandler(this)
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    applicationActivity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {
    applicationActivity = null
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    applicationActivity = binding.activity
  }

  override fun onDetachedFromActivity() {
    applicationActivity = null
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method) {
      methodOpenGiphySelection -> openGiphySelection(
        call.argument<String>(paramApiKey),
        call.argument<HashMap<String, Any>>(paramGiphySettings),
        result)
      else -> {
        result.notImplemented()
      }
    }
  }

  private fun openGiphySelection(
    apiKey: String?,
    giphySettings : HashMap<String, Any>?,
    result: Result) {

    if (apiKey.isNullOrBlank()) {
      result.error(errorConnecting, "apiKey is not set or has invalid format", "ApiKey provided: $apiKey")
      return
    }

    var settings= GPHSettings(
      GridType.waterfall,
      theme = GPHTheme.Automatic,
      stickerColumnCount = 3,
      mediaTypeConfig = arrayOf(
        GPHContentType.clips,
        GPHContentType.emoji,
        GPHContentType.gif,
        GPHContentType.recents,
        GPHContentType.sticker,
        GPHContentType.text),
      selectedContentType = GPHContentType.gif,
      showSuggestionsBar = true,
      showConfirmationScreen= true,
      enableDynamicText = true )

    if(!giphySettings.isNullOrEmpty()){
      try {
        val theme = giphySettings["theme"] as String
        val columnCount = giphySettings["columnCount"] as Int
        val contentTypes = giphySettings["contentTypes"] as ArrayList<*>
        val selectedContentType = giphySettings["selectedContentType"] as String
        val showSuggestionsBar = giphySettings["showSuggestionsBar"] as Boolean
        val showConfirmationScreen = giphySettings["showConfirmationScreen"] as Boolean
        val enabledDynamicText = giphySettings["enabledDynamicText"] as Boolean
        val mappedThemeString = (theme.substring(0, 1).uppercase()) + theme.substring(1)
        val mappedTheme = enumValueOf<GPHTheme>(mappedThemeString)
        val mappedSelectedContentType = enumValueOf<GPHContentType>(selectedContentType)
        val mediaTypeConfigArrayList : ArrayList<GPHContentType> = ArrayList()

        contentTypes.forEach {
            element -> mediaTypeConfigArrayList.add(enumValueOf(element as String))
        }

        val mediaTypeConfig: Array<GPHContentType> = mediaTypeConfigArrayList.toTypedArray()

        settings = GPHSettings(
          GridType.waterfall,
          theme = mappedTheme,
          stickerColumnCount = columnCount,
          mediaTypeConfig = mediaTypeConfig,
          selectedContentType = mappedSelectedContentType,
          showSuggestionsBar = showSuggestionsBar,
          showConfirmationScreen= showConfirmationScreen,
          enableDynamicText = enabledDynamicText )
      }
     catch(ex: Exception) {
       result.error(
         errorMappingGiphySettings,
         "Something went wrong when mapping the giphy settings",
         "When mapping $giphySettings, an error was encountered")
       return
     }
    }

    val dialog = GiphyDialogFragment.newInstance(settings, apiKey)
    dialog.gifSelectionListener = getGifSelectionListener(result)
    val supportFragmentManager = (applicationActivity as FragmentActivity).supportFragmentManager
    dialog.show(supportFragmentManager, "giphy_sdk")
  }

  private fun getGifSelectionListener(result: Result) = object : GiphyDialogFragment.GifSelectionListener {

    @SuppressLint("LogNotTimber")
    override fun onGifSelected(media: Media, searchTerm: String?, selectedContentType: GPHContentType) {
      Log.i(
        loggingTag,
        "onGifSelected\nmedia: ${media.contentUrl}, searchTerm:$searchTerm, selectedContentType: $selectedContentType"
      )
      result.success(Gson().toJson(media))
    }

    @SuppressLint("LogNotTimber")
    override fun onDismissed(selectedContentType: GPHContentType) {
      Log.i(loggingTag,"onDismissed")
    }

    @SuppressLint("LogNotTimber")
    override fun didSearchTerm(term: String) {
      Log.i(loggingTag,"didSearchTerm\n$term")
    }
  }
}

