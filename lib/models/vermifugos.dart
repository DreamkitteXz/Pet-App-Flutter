class Vermifugos {
  String id;
  String vermifugo;
  String primeiraDose;
  String doseReforco;
  String kilograma;

  Vermifugos({
    required this.id,
    required this.vermifugo,
    required this.primeiraDose,
    required this.doseReforco,
    required this.kilograma,
  });

  Vermifugos.fromMap(Map<String, dynamic> map)
      : id = map["Id"] ?? '',
        vermifugo = map["Vermifugo"] ?? '',
        primeiraDose = map["Primeira Dose"] ?? '',
        doseReforco = map["Dose de Reforço"] ?? '',
        kilograma = map["Kilogramas"] ?? '';

  Map<String, dynamic> toMap() {
    return {
      "Id": id,
      "Vermifugo": vermifugo,
      "Primeira Dose": primeiraDose,
      "Dose de Reforço": doseReforco,
      "Kilogramas": kilograma,
    };
  }
}
