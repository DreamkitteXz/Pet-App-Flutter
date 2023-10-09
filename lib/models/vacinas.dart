class Vacinas {
  String id;
  String vacina;
  String dataAplicada;
  String proximaAplicacao;
  String pesoDataAplicacao;
  String imageRotulo;
  String lote;
  String farmaceutica;
  String dataValidade;
  String nomeVet;
  String crmv;
  String observacoes;
  String? cnpj;
  String? clinica;
  String? endereco;

  Vacinas(
      {required this.id,
      required this.vacina,
      required this.dataAplicada,
      required this.proximaAplicacao,
      required this.pesoDataAplicacao,
      required this.imageRotulo,
      required this.lote,
      required this.farmaceutica,
      required this.dataValidade,
      required this.nomeVet,
      required this.crmv,
      required this.observacoes,
      this.cnpj,
      this.clinica,
      this.endereco});

  Vacinas.fromMap(Map<String, dynamic> map)
      : id = map["Id"] ?? '',
        vacina = map["Vacina"] ?? '',
        dataAplicada = map["Data Aplicada"] ?? '',
        pesoDataAplicacao = map["Peso do Pet"] ?? '',
        proximaAplicacao = map["Próxima aplicação"] ?? '',
        imageRotulo = map["Imagem do Rótulo"] ?? '',
        lote = map["Lote"] ?? '',
        farmaceutica = map["Farmaceutica"] ?? '',
        dataValidade = map["Data de Validade"] ?? '',
        nomeVet = map["Nome do Veterinário(a)"] ?? '',
        crmv = map["CRMV do Veterinário(a)"] ?? '',
        observacoes = map["Observações"] ?? '',
        cnpj = map["CNPJ"] ?? '',
        clinica = map["Clínica"] ?? '',
        endereco = map["Endereço"] ?? '';

  Map<String, dynamic> toMap() {
    return {
      "Id": id,
      "Vacina": vacina,
      "Data Aplicada": dataAplicada,
      "Peso do Pet": pesoDataAplicacao,
      "Próxima aplicação": proximaAplicacao,
      "Imagem do Rótulo": imageRotulo,
      "Lote": lote,
      "Farmaceutica": farmaceutica,
      "Data de Validade": dataValidade,
      "Nome do Veterinário(a)": nomeVet,
      "CRMV do Veterinário(a)": crmv,
      "Observações": observacoes,
      "CNPJ": cnpj,
      "Clínica": clinica,
      "Endereço": endereco
    };
  }
}
