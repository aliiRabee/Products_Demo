import 'package:core/core.dart';

class GlobalResponse extends BaseMappable {
  String? message;

  GlobalResponse({this.message});

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    message = json['message'];
    return GlobalResponse(message: message);
  }
}
