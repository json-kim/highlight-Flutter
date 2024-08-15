import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

class XFileConverter implements JsonConverter<XFile, String> {
  const XFileConverter();

  @override
  XFile fromJson(String json) => XFile(json);

  @override
  String toJson(XFile object) => object.path;
}
