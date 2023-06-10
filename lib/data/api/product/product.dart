import 'package:dio/dio.dart';
import 'package:nano_health/data/model/product_model.dart';

import '../../../core/config/dio_config.dart';

class Product {
  Future<List<ProductModel>> getAllProducts() async {
    Response response = await api.get('products');
    return response.data == null
        ? []
        : (response.data as List<dynamic>)
            .map((product) => ProductModel.fromJson(product))
            .toList();
  }

  Future<ProductModel?> getSingleProduct(String productID) async {
    Response response = await api.get('products/$productID');
    return response.data == null ? null : ProductModel.fromJson(response.data);
  }
}
