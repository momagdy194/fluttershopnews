import 'dart:convert';

import 'package:shopnew/Api/api_utl.dart';
import 'package:shopnew/main.dart';
import 'package:shopnew/product/product.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  Map<String, String> header = {"Accept": "application/json"};

  Future<List<Product>> fetchProducts(int page) async {
    String URL = ApiUtil.PRODUCT_API_URL + '?page = ' + page.toString();
    http.Response response = await http.get(URL, headers: header);
    List<Product> product = [];
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);

      for (var item in body['data']) {
        product.add(Product.fromJson(item));
      }
      return product;
    }
    return null;
  }

  Future<Product> fetchProduct(int id)async{

    http.Response response= await http.get(ApiUtil.PRODUCT_id_API_URL+id.toString(),headers: header);

    if(response.statusCode==200){
  var body=jsonDecode(response.body);
  var data=body['data'];
  return Product.fromJson(data);
}return null;
  }

}