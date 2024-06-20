class Membro {
  final String id;
  final String codigoMembro;
  final String nomeCompleto;
  final String fotografia;
  final String phonenumber;
  final String localNascimento;
  final String dataNascimento;
  final String dataBaptismoEsp;
  final String dataBaptismoAguas;
  final String estadoCivil;

  Membro({
    required this.id,
    required this.codigoMembro,
    required this.nomeCompleto,
    required this.fotografia,
    required this.phonenumber,
    required this.localNascimento,
    required this.dataNascimento,
    required this.dataBaptismoEsp,
    required this.dataBaptismoAguas,
    required this.estadoCivil,
  });

  factory Membro.fromJson(Map<String, dynamic> json) {
    return Membro(
      id: json['id'],
      codigoMembro: json['codigoMembro'],
      nomeCompleto: json['nomeCompleto'],
      fotografia: json['fotografia'],
      phonenumber: json['phonenumber'],
      localNascimento: json['localNascimento'],
      dataNascimento: json['dataNascimento'],
      dataBaptismoEsp: json['dataBaptismoEsp'],
      dataBaptismoAguas: json['dataBaptismoAguas'],
      estadoCivil: json['estadoCivil'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'codigoMembro': codigoMembro,
      'nomeCompleto': nomeCompleto,
      'fotografia': fotografia,
      'phonenumber': phonenumber,
      'localNascimento': localNascimento,
      'dataNascimento': dataNascimento,
      'dataBaptismoEsp': dataBaptismoEsp,
      'dataBaptismoAguas': dataBaptismoAguas,
      'estadoCivil': estadoCivil,
    };
  }
}
