class InvoiceModel {
  final String cnpj;
  final String local;
  final String numero;
  final String data;
  final String cpf;
  final String vTotal;
  final String desconto;
  final String id;

  InvoiceModel({
    required this.cnpj,
    required this.local,
    required this.numero,
    required this.data,
    required this.cpf,
    required this.vTotal,
    required this.desconto,
    required this.id,
  });

  factory InvoiceModel.fromJson(Map<String, dynamic> json) {
    return InvoiceModel(
      cnpj: json['cnpj'],
      local: json['local'],
      numero: json['numero'],
      data: json['data'],
      cpf: json['cpf'],
      vTotal: json['vTotal'],
      desconto: json['desconto'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'cnpj': cnpj,
        'local': local,
        'numero': numero,
        'data': data,
        'cpf': cpf,
        'vTotal': vTotal,
        'desconto': desconto,
        'id': id,
      };
}