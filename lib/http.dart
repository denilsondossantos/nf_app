import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'dart:developer';

  // Future<Map> capturaItens() async {
  Future<String> capturaItens(String contentString) async {
    List<Map<dynamic,dynamic>> lista = [];
    String resultJson;
    var positionArray = 0;
    var itensCompra = {}; //armazena as informações finais dos itens comprados
    var infoItens = ['codigo', 'descricao', 'qntd', 'tipo', 'vUnit', 'vTotal'];
    var itens = [];
    var i = 5;
    var loop = true;
    var dataNota = {}; //armazena as informações finais da nota
    // var infosPurchase = [];
    var infosNota = [
      'cnpj',
      'local',
      'numero',
      'data',
      'cpf',
      'vTotal',
      'desconto',
      'pagamento'
    ];
    String urlAcesso =  'https://www.sefaz.rs.gov.br/ASP/AAE_ROOT/NFE/SAT-WEB-NFE-NFC_QRCODE_1.asp?${contentString.toString().split('?')[1]}';
    var url = Uri.parse(urlAcesso);
    var response = await http.get(url);
    dom.Document document = parser.parse(response.body);
    try {
      //loop responsavel pela coleta dos itens da nota fiscal no html
      while (loop) {
        var content = document
            .getElementsByClassName('NFCDetalhe_Item')[i]
            .innerHtml
            .toString();
        //itens.add('"$content"');
        itens.add('$content');

        if (content == '<strong>Versão XSLT: 1.10</strong>') {
          loop = false;
        }
        i++;
      }
      //Colega das informações da nota
      var cnpj = document //pega CNPJ apenas os numeros
          .getElementsByClassName('NFCCabecalho_SubTitulo1')[0]
          .innerHtml
          .toString()
          .split(' ')[48];

      // dataNota[infosNota[0]] = '"$cnpj"';
      dataNota[infosNota[0]] = cnpj;
      //----------------------------------------------------
      var local = document //pega local
          .getElementsByClassName('NFCCabecalho_SubTitulo')[0]
          .innerHtml;

      dataNota[infosNota[1]] = local;
      //-----------------------------------------------------
      var dataHora = document //pega numero, data e hora
          .getElementsByClassName('NFCCabecalho_SubTitulo')[2]
          .innerHtml;
      dataNota[infosNota[2]] = dataHora.toString().split(' ')[26];
      dataNota[infosNota[3]] = dataHora.toString().split(' ')[78] +
          ' ' +
          dataHora.toString().split(' ')[79];
      //--------------------------------------------------------
      var cpf = document //pega o cpf
          .getElementsByClassName('NFCCabecalho_SubTitulo')[8]
          .innerHtml;
      var validCpf = cpf.toString().split(' ')[26];
      if (validCpf == 'Consumidor') {
        // dataNota[infosNota[4]] = '"Consumidor não identificado"';
        dataNota[infosNota[4]] = 'Consumidor não identificado';
      } else {
        // dataNota[infosNota[4]] = '"${cpf.toString().split(' ')[52]}"';
        dataNota[infosNota[4]] = cpf.toString().split(' ')[52];
      }
    } catch (err) {
      log('Erro na captura das informações no html!');
      log(err as String);
    }

    //Conta a quantidade de itens da nota
    for (var i = 0; i <= itens.length; i++) {
      // if (itens[i] == '"Valor total R\$"') {
      if (itens[i] == 'Valor total R\$') {
        positionArray = i;
        break;
      }
    }
    //cria os itens dentro do itensCompra conforme numero de itens.
    var numberItens = (positionArray) / 6;

    for (var j = 1; j <= numberItens; j++) {
      itensCompra[j] = {};
    }
    //armazeina os itens comprados na variavel final
    var cont = 1;
    var contInfoNota = 0;
    try {
      dataNota[infosNota[5]] = itens[positionArray + 1]; //pega valor total
      dataNota[infosNota[6]] = itens[positionArray + 3]; //pega desconto

      for (var i = 0; i <= itens.length; i++) {
        itensCompra[cont][infoItens[contInfoNota]] = itens[i];
        contInfoNota++;
        if (contInfoNota == 6) {
          contInfoNota = 0;
          cont++;
          if(cont==itensCompra.length+1)break;
        }
      }
      }catch (error){}

    //mete itens dentro da lista
    for(var i=0; i < itensCompra.length; i++){
      lista.add(itensCompra[i+1]);
    }

    var jsonItens= jsonEncode(lista);

    //monta objeto para retornar o json   
    var jsonInfo = jsonEncode(dataNota);
    resultJson = '''{"InfoNota": $jsonInfo ,"InfoItens": ${jsonItens}}''';

    log('${resultJson}');

    return resultJson;
}