import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nano_health/core/util/extension.dart';
import 'package:nano_health/module/product/screen/product_details_screen.dart';
import 'package:nano_health/module/product/widget/custom_app_bar.dart';
import 'package:nano_health/module/product/widget/product_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../core/theme/color.dart';
import '../../../domain/product/product.dart';

class ProductScreen extends ConsumerStatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final result = ref.watch(getAllProductsProvider);
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: result.when(
              skipLoadingOnRefresh: false,
              data: (products) => SmartRefresher(
                    controller: _refreshController,
                    enablePullDown: true,
                    enablePullUp: false,
                    onRefresh: () {
                      ref.refresh(getAllProductsProvider);
                      _refreshController.refreshCompleted();
                    },
                    child: ListView.separated(
                      itemCount: products.length,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      itemBuilder: (BuildContext context, int index) => InkWell(
                        onTap: () {
                          context.push(ProductDetailsScreen(
                            productID: products[index].id.toString(),
                          ));
                        },
                        child: ProductCard(
                          productModel: products[index],
                        ),
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          const Padding(
                        padding: EdgeInsets.symmetric(vertical: 22.0),
                        child: Divider(),
                      ),
                    ),
                  ),
              error: (error, stackTrace) => Center(
                    child: Row(
                      children: [
                        Expanded(child: Text(error.toString())),
                        IconButton(
                            onPressed: () {
                              ref.refresh(getAllProductsProvider);
                            },
                            icon: const Icon(Icons.refresh,
                                color: Color(kPrimaryColor))),
                      ],
                    ),
                  ),
              loading: () => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ))),
    );
  }
}
