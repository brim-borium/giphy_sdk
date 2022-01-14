package de.minimalme.giphy_sdk

import android.app.Activity
import android.content.Context
import android.util.Log
import androidx.annotation.NonNull
import androidx.fragment.app.FragmentActivity
import com.giphy.sdk.core.models.Media
import com.giphy.sdk.ui.GPHContentType
import com.giphy.sdk.ui.GPHSettings
import com.giphy.sdk.ui.themes.GridType
import com.giphy.sdk.ui.views.GiphyDialogFragment
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** GiphySdkPlugin */
class GiphySdkPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity

  /// application context
  private var applicationContext: Context? = null
  private var applicationActivity: Activity? = null

  /// method channel
  private lateinit var channel: MethodChannel
  private val channelName = "giphy_sdk"
  private val loggingTag = "giphy_sdk"

  /// connecting
  private val methodConnectToGiphy = "connectToGiphy"

  /// parameters
  private val paramApiKey = "apiKey"

  /// errors
  private val errorConnecting = "errorConnecting"

  /// giphy setup

  private val giphySettings = GPHSettings(
    GridType.waterfall,
    selectedContentType = GPHContentType.gif,
    enableDynamicText = true )


  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "giphy_sdk")
    channel.setMethodCallHandler(this)
    onAttachedToEngine(flutterPluginBinding.applicationContext, flutterPluginBinding.binaryMessenger)
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    applicationContext = null
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
      methodConnectToGiphy -> connectToGiphy(call.argument(paramApiKey), result)
      else -> {
        result.notImplemented()
      }
    }
  }

  private fun connectToGiphy(apiKey: String?, result: Result) {
    if (apiKey.isNullOrBlank()) {
      result.error(errorConnecting, "apiKey is not set or has invalid format", "ApiKey provided: $apiKey")
    } else {
      val dialog = GiphyDialogFragment.newInstance(giphySettings, apiKey)
      dialog.gifSelectionListener = getGifSelectionListener()
      val supportFragmentManager = (applicationActivity as FragmentActivity).supportFragmentManager
      dialog.show(supportFragmentManager, "giphy_sdk")
      return result.success(true)
    }
  }

  private fun getGifSelectionListener() = object : GiphyDialogFragment.GifSelectionListener {
    override fun onGifSelected(media: Media, searchTerm: String?, selectedContentType: GPHContentType) {
      Log.i(loggingTag,"onGifSelected\nmedia: $media, searchTerm:$searchTerm, selectedContentType: $selectedContentType")
    }

    override fun onDismissed(selectedContentType: GPHContentType) {
      Log.i(loggingTag,"onDismissed")
    }

    override fun didSearchTerm(term: String) {
      Log.i(loggingTag,"didSearchTerm\n$term")
    }
  }

  private fun onAttachedToEngine(applicationContext: Context, messenger: BinaryMessenger) {

    this.applicationContext = applicationContext
  }
}
