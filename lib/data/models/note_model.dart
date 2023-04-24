import 'package:flutter_application_1/data/models/product_model.dart';
import 'invoice_model.dart';

class NoteModel {
  final InvoiceModel nota;
  final List<ProductModel> produto;

  NoteModel({
    required this.nota,
    required this.produto,
  });
}