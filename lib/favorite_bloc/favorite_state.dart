import 'package:equatable/equatable.dart';
import 'package:testing_ground/models/favorite.dart';

class FavoriteState extends Equatable {
  final List<Favorite> favorites;

  const FavoriteState({required this.favorites});

  @override
  List<Object> get props => [favorites];
}