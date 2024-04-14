import 'package:ecom_mobile/Model/produto.dart';
import 'package:ecom_mobile/Model/usuario.dart';
import 'package:ecom_mobile/objectbox.g.dart';

class ObjectBox {
  /// The Store of this app.
  static late final Store store;
  static late final Box<Produto> produtoBox;
  static late final Box<Usuario> usuarioBox;

  ObjectBox._create(Store store) {
    usuarioBox = Box<Usuario>(store);
    produtoBox = Box<Produto>(store);
    // Add any additional setup code, e.g. build queries.
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    ObjectBox.store = await openStore();
    return ObjectBox._create(ObjectBox.store);
  }
}
