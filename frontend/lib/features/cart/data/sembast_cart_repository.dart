import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import 'package:frontend/features/cart/data/local_cart_repository.dart';
import 'package:sembast_web/sembast_web.dart';

class SembastCartRepository implements LocalCartRepository {
  SembastCartRepository(this.db);
  final Database db;

  static Future<Database> initSembast(String filename) async {
    if (!kIsWeb) {
      final dir = await getApplicationDocumentsDirectory();
      return databaseFactoryIo.openDatabase('${dir.path}/$filename');
    } else {
      return databaseFactoryWeb.openDatabase(filename);
    }
  }

  static Future<SembastCartRepository> create() async {
    return SembastCartRepository(await initSembast('default.db'));
  }

  @override
  addToCart() {
    // TODO: implement addToCart
    throw UnimplementedError();
  }

  @override
  fetchCart() {
    // TODO: implement fetchCart
    throw UnimplementedError();
  }

  @override
  removeFromCart() {
    // TODO: implement removeFromCart
    throw UnimplementedError();
  }
}
