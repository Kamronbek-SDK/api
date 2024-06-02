import 'dart:convert';

import 'package:api/class.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<Class>> getProd() async{
    final allProd = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    final selectAll = json.decode(allProd.body);
    final response = Class.fromJson(selectAll);
    final list = [
      response.id,
      response.title,
      response.price,
      response.description,
      response.category,
      response.image,
      response.rating,
    ];
    return list ?? [];
  }
}