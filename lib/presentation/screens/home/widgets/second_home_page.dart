import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/invoice_model.dart';
import 'package:hive/hive.dart';
import 'dart:developer';
import 'dart:convert';
class SecondHomePage extends StatefulWidget {


  const SecondHomePage({
    super.key,
  });
  @override
  State<SecondHomePage> createState() => _SecondHomePageState();
}

class _SecondHomePageState extends State<SecondHomePage> {
  var _box;
  List<InvoiceModel> listaNf = [];

  @override
  void initState() {
     super.initState();
     _box = Hive.box('nfBox');
     listaNf = getNf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: listaNf.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.store, size: 30,),
              title: Text(listaNf[index].local),
              subtitle: Text('Valor total R\$: ${listaNf[index].vTotal}  Data: ${listaNf[index].data} ', textAlign: TextAlign.left,),
            ),
          );},
      ),
    );}


  List<InvoiceModel> getNf(){
      try{
      List<InvoiceModel> lista = [];
      Map <String, dynamic>  json; 
      for(int i = 1; i < _box.length; i++){
        json  = jsonDecode(_box.get(i));
        lista.add(InvoiceModel.fromJson(json['InfoNota']));  
      }
      //log('Tamanho da lista:${_box.length}');
      //log('primeiro item da lista:${lista[0].local}');
      return lista;   
      }catch(e){
        log('error:$e');
        throw{
          log('Não faz absolutamente nada')
        };
      } 
    }

  }



