class Vacinas {
  String id;
  String vacina;
  String dataAplicada;
  String proximaAplicacao;
  String pesoDataAplicacao;
  String nomeVet;
  String crmv;

  Vacinas(
      {required this.id,
      required this.vacina,
      required this.dataAplicada,
      required this.proximaAplicacao,
      required this.pesoDataAplicacao,
      required this.nomeVet,
      required this.crmv});

  Vacinas.fromMap(Map<String, dynamic> map)
      : id = map["Id"] ?? '',
        vacina = map["Vacina"] ?? '',
        dataAplicada = map["Data Aplicada"] ?? '',
        pesoDataAplicacao = map["Peso do Pet"] ?? '',
        proximaAplicacao = map["Próxima aplicação"] ?? '',
        nomeVet = map["Nome do Veterinário(a)"] ?? '',
        crmv = map["CRMV do Veterinário(a)"] ?? '';

  Map<String, dynamic> toMap() {
    return {
      "Id": id,
      "Vacina": vacina,
      "Data Aplicada": dataAplicada,
      "Peso do Pet": pesoDataAplicacao,
      "Próxima aplicação": proximaAplicacao,
      "Nome do Veterinário(a)": nomeVet,
      "CRMV do Veterinário(a)": crmv,
    };
  }
}
