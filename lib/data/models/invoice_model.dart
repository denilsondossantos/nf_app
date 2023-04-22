class InvoiceModel {
  final String cnpj;
  final String local;
  final String numero;
  final String data;
  final String cpf;
  final String vTotal;
  final String desconto;

  InvoiceModel({
    required this.cnpj,
    required this.local,
    required this.numero,
    required this.data,
    required this.cpf,
    required this.vTotal,
    required this.desconto,
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
      };
}