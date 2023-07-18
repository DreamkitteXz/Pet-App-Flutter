class Pet {
  String id;
  String name;
  String raca;
  String sexo;
  String cor;
  String dataNasc;
  String isInteiro;
  String? chip;

  Pet({
    required this.id,
    required this.name,
    required this.raca,
    required this.sexo,
    required this.cor,
    required this.dataNasc,
    required this.isInteiro,
    this.chip,
  });

  Pet.fromMap(Map<String, dynamic> map)
      : id = map["Id"],
        name = map["Name"],
        raca = map["Raça"],
        sexo = map["Sexo"],
        cor = map["Cor"],
        dataNasc = map["Data de Nascemento"],
        isInteiro = map["Intero ou Castrado"],
        chip = map["Numero de Chip"];

  Map<String, dynamic> toMap() {
    return {
      "Id": id,
      "Name": name,
      "Raça": raca,
      "Sexo": sexo,
      "Cor": cor,
      "Data de Nascimento": dataNasc,
      "Inteiro ou Castrado": isInteiro,
      "Chip": chip,
    };
  }
}
