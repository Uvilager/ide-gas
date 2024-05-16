import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_cart_repository.g.dart';

abstract class LocalCartRepository {
  fetchCart() {
    // TODO: implement fetchCart
  }

  addToCart() {
    // TODO: implement addToCart
  }

  removeFromCart() {
    // TODO: implement removeFromCart
  }
}

@Riverpod(keepAlive: true)
LocalCartRepository localCartRepository(LocalCartRepositoryRef ref) {
  // * Override this in the main method
  throw UnimplementedError();
}
