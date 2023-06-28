class ProduitModel {
  String? numProduit;
  String? design;
  double? prix;
  int? quantite;

  ProduitModel({this.numProduit, this.design, this.prix, this.quantite});

  ProduitModel.fromJson(Map<String, dynamic> json) {
    numProduit = json['numProduit'];
    design = json['design'];
    prix = json['prix'];
    quantite = json['quantite'];
  }
}
