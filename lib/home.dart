import 'package:flutter/material.dart';
import 'qrcode.dart';
import 'dart:developer';


//void main() => runApp(const MyHome());

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}


class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List <String> items = ['negao','salame', 'chupeta'];
  int _selectedIndex = 0;
  //var _height;


  static const  TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final  List<Widget> _widgetOptions = <Widget>[
  Container(
    color: Colors.redAccent,
    alignment: Alignment.center,
    child: const Text(
      'teste container', 
      style: optionStyle,
    ),
  ),
  Column( 
    children:<Widget>[
        Container(
          height: 300,
          color: Colors.amber[300],
          alignment: Alignment.topCenter,
          child: const Text('Você não cadastrou\n nenhuma nota'),
        ),

         Container(
          color: Colors.red.shade50,
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
          onPressed:((){
            log('ola');    
            //_aqui dveria chamar a tela de qr code  
            }),
          child:  const Icon(Icons.add),
        ),
        ),

      ],
    ),

  const Text(
    'Index 2: School',
    style: optionStyle,
  ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void chupaRola(){
    setState(() {
    Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const QRViewExample(),
    ));  
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro NF'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_rounded),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.cyan.shade600,
        onTap: _onItemTapped,
      ),
    );
  }
}
