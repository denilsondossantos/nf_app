import 'package:flutter/material.dart';
import 'home.dart';
void main() => runApp(const MaterialApp(home: MyHome()));



/*
class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro NF')),
      body: Column(

        children:<Widget>[
                ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const QRViewExample(),
            ));
          },
          child: const Text('Escanear'),
        ),

        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async{
                await capturaItens('https://www.sefaz.rs.gov.br/NFCE/NFCE-COM.aspx?p=43230492754738016328650270001165211982273520|2|1|1|8ea2be1645c0fc15ad39ab32a2f2eff6b5eb24ba')
                .then((value) => print(""));
          },
          child: const Text('Debug list'),
        ),

        ],
        
         /*ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const QRViewExample(),
            ));
          },
          child: const Text('Escanear'),
        ),*/
      ),
    );
  }
}*/
