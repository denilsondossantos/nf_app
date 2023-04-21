import 'package:flutter/material.dart';
import 'json.dart';
import 'dart:convert';


class ListScreen extends StatefulWidget {
   final String data;
   
   const ListScreen({ super.key,
    required this.data,
   });
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  @override
  Widget build(BuildContext context) {
    List<Produto> produto = [];
    Map<String, dynamic> json = jsonDecode(widget.data);
    //var info =  Nota.fromJson(json['InfoNota']);
    for(int i=0; i< json['InfoItens'].length; i++ ){
      produto.add(Produto.fromJson(json['InfoItens'][i]));
    }

    const title = 'Lista de Produtos';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          itemCount: produto.length,
          itemBuilder: (context, index){
            return Card(
                    child: ListTile(
                    leading: const Icon(Icons.local_grocery_store_outlined ),
                    title: Text(produto[index].descricao),
                    subtitle: Row(
                      children: <Widget>[
                        Text('Quantidade: ${produto[index].qntd}'),
                        const SizedBox(width: 30),
                        Text('R\$: ${produto[index].vUnit}' 
                        ),
                        
                        //Icon(Icons.sentiment_very_satisfied),
                      ],
                    ),
                    //trailing: Icon(Icons.local_grocery_store_outlined ),
                  ),
                );
              },
             ),
            /*ListTile(
                leading: Icon(Icons.),
                title: Text(produto[index].descricao),
                subtitle: Text(produto[index].vUnit),
            );
          },
        ),*/
      ),
    );
  }
}

