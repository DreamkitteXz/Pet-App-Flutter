class Vacinas {
  String id;
  String name;
  String dataAplicada;
  String proximaAplicacao;
  String tipo;
  String pesoDataAplicacao;

  Vacinas({
    required this.id,
    required this.name,
    required this.dataAplicada,
    required this.proximaAplicacao,
    required this.tipo,
    required this.pesoDataAplicacao,
  });

  Vacinas.fromMap(Map<String, dynamic> map)
      : id = map["Id"] ?? '',
        name = map["Name"] ?? '',
        dataAplicada = map["Data Aplicada"] ?? '',
        pesoDataAplicacao = map["Peso do Pet"] ?? '',
        tipo = map["Tipo"] ?? '',
        proximaAplicacao = map["Próxima aplicação"] ?? '';

  Map<String, dynamic> toMap() {
    return {
      "Id": id,
      "Nome da Vacina": name,
      "Data Aplicada": dataAplicada,
      "Peso do Pet": pesoDataAplicacao,
      "Tipo": tipo,
      "Próxima aplicação": proximaAplicacao,
    };
  }
}
