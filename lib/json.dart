class Nota {
  final String cnpj;
  final String local;
  final String numero;
  final String data;
  final String cpf;
  final String vTotal;
  final String desconto;

  Nota(this.cnpj, this.local,this.numero, this.data, this.cpf, this.vTotal, this.desconto);

  Nota.fromJson(Map<String, dynamic> json)
      : cnpj = json['cnpj'],
        local = json['local'],
        numero = json['numero'],
        data = json['data'],
        cpf = json['cpf'],
        vTotal = json['vTotal'],
        desconto = json['desconto'];

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



class Produto {
  final String codigo;
  final String descricao;
  final String qntd;
  final String tipo;
  final String vUnit;
  final String vTotal;

  Produto(this.codigo, this.descricao,this.qntd, this.tipo, this.vUnit, this.vTotal);

  Produto.fromJson(Map<String, dynamic> json)
      : codigo = json['codigo'],
        descricao = json['descricao'],
        qntd = json['qntd'],
        tipo = json['tipo'],
        vUnit = json['vUnit'],
        vTotal = json['vTotal'];

  Map<String, dynamic> toJson() => {
        'codigo': codigo,
        'descricao': descricao,
        'qntde': qntd,
        'tipo': tipo,
        'vUnit': vUnit,
        'vTotal': vTotal,
      };
}