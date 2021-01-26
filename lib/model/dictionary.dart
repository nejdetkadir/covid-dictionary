class Dictionary {
  String key;
  String value;

  Dictionary.fromJsonMap(Map<String, dynamic> map)
      : key = map["key"],
        value = map["value"];
}
