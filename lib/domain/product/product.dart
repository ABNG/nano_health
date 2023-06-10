import 'package:nano_health/core/config/exception_builder.dart';
import 'package:nano_health/data/api/product/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/model/product_model.dart';

part 'product.g.dart';

@riverpod
Future<List<ProductModel>> getAllProducts(GetAllProductsRef ref) async {
  return exceptionBuilder(() async {
    return await Product().getAllProducts();
  });
}

@riverpod
Future<ProductModel> getSingleProduct(
    GetSingleProductRef ref, String productID) async {
  return exceptionBuilder(() async {
    return await Product().getSingleProduct(productID);
  });
}
