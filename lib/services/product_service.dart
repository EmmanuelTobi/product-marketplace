import 'dart:convert' as JSON;
import 'package:http/http.dart' as http;
import 'package:marketplace/services/api_helper.dart';
import 'package:marketplace/services/api_routes.dart';
import 'package:marketplace/ui/product/model/product_list_model.dart';

class ProductService {

  List<ProductModel>? productListModel;

  Future<void> fetchProducts() async {

    var response = await http.get(Uri.parse(APIRoutes.getProducts),
        headers: APIHelper().requestHeaders());

    final json = JSON.jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {

      productListModel = List<ProductModel>.from(
          json.map((x) => ProductModel.fromJson(x))
      );

    } else {
      var error = json["message"];
      throw Exception(error);
    }
  }

}