import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourismo/repositories/repositories.dart';

import '../models/produit_model.dart';

part 'produit_event.dart';
part 'produit_state.dart';

class ProduitBloc extends Bloc<ProduitEvent, ProduitState> {
  final ProduitRepository _produitRepository;
  ProduitBloc(this._produitRepository) : super(ProduitLoadingState()) {
    on<ProduitEvent>((event, emit) async {
      emit(ProduitLoadingState());
      try {
        final produits = await _produitRepository.getProduit();
        emit(ProduitLoadedState(produits: produits));
      } catch (e) {
        emit(ProduitErrorState(error: e.toString()));
      }
    });
  }
}
