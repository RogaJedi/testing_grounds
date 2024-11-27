import 'package:equatable/equatable.dart';

class Favorite extends Equatable {
  final int favoriteId;
  final int userId;
  final int productId;

  const Favorite({
    required this.favoriteId,
    required this.userId,
    required this.productId,
  });

  @override
  List<Object> get props => [favoriteId, userId, productId];
}