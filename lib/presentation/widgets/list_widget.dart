import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/invoice_model.dart';
import 'package:flutter_application_1/data/models/note_model.dart';
import 'package:flutter_application_1/data/models/product_model.dart';
import 'dart:convert';
import 'package:hive/hive.dart';
import 'dart:developer';

class ListScreen extends StatefulWidget {
  final String data;
  final bool saveNote;

  const ListScreen({
    super.key,
    required this.data,
    required this.saveNote,
  });
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
   var _box;
   late NoteModel nf;
   String title = 'Lista de Produtos';
   List<ProductModel> produto = [];
   Map<String, dynamic> json = <String,dynamic>{};

  @override
  void initState() {
     _box = Hive.box('nfBox');
     builNote();
     if(widget.saveNote == true){_writeNewValue(widget.data);}
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:  Text(title),
      ),
      body: Column(children:[
      Expanded(child: ListView.builder(
        shrinkWrap: true,
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
      ),
      Row(children:[
        Container(
         padding: const EdgeInsets.all(3.0), 
         margin: const EdgeInsets.all(3),
         decoration:  BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.grey.shade100, Colors.grey.shade200, Colors.grey.shade300] ,  
              ),
            ),
         child: Text(' Total: R\$ ${nf.nota.vTotal}',
         style: const TextStyle(fontSize: 20),), 
        ),

        Container(
        padding: const EdgeInsets.all(3.0), 
        margin: const EdgeInsets.all(3),
        decoration:  BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.grey.shade100, Colors.grey.shade200, Colors.grey.shade300] ,  
              ),
            ),
         child: Text('Desconto: R\$ ${nf.nota.desconto}',
         style: const TextStyle(fontSize: 20),
         ),  
        ),   
      ]), 
      ]),
    );
  }

    //functions
  void _writeNewValue(String nota) {
    try{
      //_box.put('0', nota);
      _box.add(nota);
    }catch(error){
      log('message error: $error');
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

}
