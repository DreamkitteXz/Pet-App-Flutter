class Vermifugos {
  String id;
  String name;
  String dataInicio;
  String quantPorDia;
  String miliGrama;
  String dataFinal;

  Vermifugos({
    required this.id,
    required this.name,
    required this.dataInicio,
    required this.dataFinal,
    required this.miliGrama,
    required this.quantPorDia,
  });

  Vermifugos.fromMap(Map<String, dynamic> map)
      : id = map["Id"] ?? '',
        name = map["Nome do vermifugo"] ?? '',
        dataInicio = map["Data de inicio"] ?? '',
        dataFinal = map["Data de termino"] ?? '',
        miliGrama = map["Miligramas"] ?? '',
        quantPorDia = map["Quantos por dia"] ?? '';

  Map<String, dynamic> toMap() {
    return {
      "Id": id,
      "Nome do vermifugo": name,
      "Data de inicio": dataInicio,
      "Data de termino": dataFinal,
      "Miligramas": miliGrama,
      "Quantos por dia": quantPorDia,
    };
  }
}
