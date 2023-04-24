import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/invoice_model.dart';
import 'package:flutter_application_1/data/models/note_model.dart';
import 'package:flutter_application_1/data/models/product_model.dart';
import 'dart:convert';
import 'package:hive/hive.dart';
import 'dart:developer';

class ListScreen extends StatefulWidget {
  final String data;

  const ListScreen({
    super.key,
    required this.data,
  });
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
   var _box;
   var nf;
   String title = 'Lista de Produtos';
   List<ProductModel> produto = [];
   Map<String, dynamic> json = <String,dynamic>{};

  @override
  void initState() {
     _box = Hive.box('nfBox');
     builNote();
     _writeNewValue(nf);
     _readLatestValue();
    super.initState();
  }

  //functions
  void _writeNewValue(NoteModel nota) {
    try{
      _box.put('0', nota);
    }catch(error){
      log('message error: $error');
    }
  }

  void _readLatestValue() {
    try{
    var dados = _box.get('0');
    dados != null ? log('testeBox: ${dados.nota.local}') : log('Sem dados na memória');
    }catch(error){
      log('error message: $error');
    }
  }

  void builNote(){
    json = jsonDecode(widget.data);
     for (int i = 0; i < json['InfoItens'].length; i++) {
      produto.add(ProductModel.fromJson(json['InfoItens'][i]));
    }
    InvoiceModel info  = InvoiceModel.fromJson(json['InfoNota']);
    nf = NoteModel(nota: info, produto: produto);
   }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:  Text(title),
      ),
      body: ListView.builder(
        itemCount: produto.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.local_grocery_store_outlined),
              title: Text(produto[index].descricao),
              subtitle: Row(
                children: <Widget>[
                  Text('Quantidade: ${produto[index].qntd}'),
                  const SizedBox(width: 30),
                  Text('R\$: ${produto[index].vUnit}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
