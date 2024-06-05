import 'package:api/api.dart';
import 'package:api/class.dart';

class Repository {
  final _api = ApiService(buildDioClient('http://fakestoreapi.com'));
  Future<List<Product>> getProducts() => _api.getProducts();
}