import 'package:churchdesktop/Model/membro.model.dart';

class Ministro {
  String? id;
  String dataBaptismoEsp;
  String membroId;
  Membro membro;
  String biografia;

  Ministro({
    required this.id,
    required this.dataBaptismoEsp,
    required this.membroId,
    required this.membro,
    required this.biografia,
  });

  factory Ministro.fromJson(Map<String, dynamic> json) {
    return Ministro(
      id: json['id'],
      dataBaptismoEsp: json['dataBaptismoEsp'],
      membroId: json['membroId'],
      membro: Membro.fromJson(json['membro']),
      biografia: json['biografia'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dataBaptismoEsp': dataBaptismoEsp,
      'membroId': membroId,
      'membro': membro.toJson(),
      'biografia': biografia,
    };
  }

  static List<Ministro> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Ministro.fromJson(json)).toList();
  }
}
