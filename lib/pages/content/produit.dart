import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourismo/bloc/produit_bloc.dart';
import 'package:tourismo/models/produit_model.dart';
import 'package:tourismo/repositories/repositories.dart';

class Produit extends StatelessWidget {
  const Produit({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  ProduitBloc(ProduitRepository())..add(LoadProduitEvent())),
        ],
        child: BlocBuilder<ProduitBloc, ProduitState>(
          builder: (context, state) {
            if (state is ProduitLoadingState) {
              return LinearProgressIndicator();
            }
            if (state is ProduitLoadedState) {
              List<ProduitModel> produitList = state.produits;
              return ListView.builder(
                itemCount: produitList.length,
                itemBuilder: (_, int index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      child: ListTile(
                          title: Text(
                            '${produitList[index].design}',
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            '${produitList[index].prix} MGA',
                            style: const TextStyle(color: Colors.white),
                          ),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                produitList[index].numProduit.toString()),
                          )),
                    ),
                  );
                },
              );
            }
            return const LinearProgressIndicator(
              backgroundColor: Colors.amber,
            );
          },
        ));
  }
}
