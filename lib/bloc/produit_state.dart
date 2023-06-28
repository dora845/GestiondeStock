part of 'produit_bloc.dart';

@immutable
abstract class ProduitState {}

class ProduitLoadingState extends ProduitState {}

class ProduitLoadedState extends ProduitState {
  final List<ProduitModel> produits;
  ProduitLoadedState({required this.produits});
}

class ProduitErrorState extends ProduitState {
  final String error;
  ProduitErrorState({required this.error});
}
