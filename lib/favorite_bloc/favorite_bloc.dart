import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_ground/api/favorite_list.dart';
import 'favorite_event.dart';
import 'favorite_state.dart';
import 'package:testing_ground/models/favorite.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteState(favorites: FavoriteList.favorites)) {
    on<ToggleFavorite>(_onToggleFavorite);
  }

  void _onToggleFavorite(ToggleFavorite event, Emitter<FavoriteState> emit) {
    if (FavoriteList.isFavorite(event.productId)) {
      FavoriteList.removeFavorite(event.productId);
    } else {
      final newFavorite = Favorite(
        favoriteId: DateTime.now().millisecondsSinceEpoch,
        userId: 0,
        productId: event.productId,
      );
      FavoriteList.addFavorite(newFavorite);
    }
    emit(FavoriteState(favorites: List.from(FavoriteList.favorites)));
  }
}