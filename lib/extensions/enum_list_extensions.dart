///Extension for mapping a list of enums to strings
///@nodoc
extension EnumListExtension on List<Enum> {
  ///maps a list of enums to a list of strings
  ///@nodoc
  List<String> toStringList() {
    var stringList = <String>[];
    for (var element in this) {
      stringList.add(element.name);
    }
    return stringList;
  }
}
