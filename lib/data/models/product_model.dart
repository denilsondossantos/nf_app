class ProductModel {
  final String codigo;
  final String descricao;
  final String qntd;
  final String tipo;
  final String vUnit;
  final String vTotal;

  ProductModel({
    required this.codigo,
    required this.descricao,
    required this.qntd,
    required this.tipo,
    required this.vUnit,
    required this.vTotal,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(
      codigo: json['codigo'],
      descricao: json['descricao'],
      qntd: json['qntde'],
      tipo: json['tipo'],
      vUnit: json['vUnit'],
      vTotal: json['vTotal'],
    );
  }

  Map<String, dynamic> toJson() => {
        'codigo': codigo,
        'descricao': descricao,
        'qntde': qntd,
        'tipo': tipo,
        'vUnit': vUnit,
        'vTotal': vTotal,
      };
}
