import 'dart:convert';

import 'package:http/http.dart';
import 'package:tourismo/env.dart';

import '../models/produit_model.dart';

class ProduitRepository {
  String produitURL = '$globalURL/produit';

  Future<List<ProduitModel>> getProduit() async {
    Response response = await get(Uri.parse(produitURL));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => ProduitModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
