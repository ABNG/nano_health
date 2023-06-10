import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nano_health/core/theme/color.dart';
import 'package:nano_health/core/util/extension.dart';
import 'package:nano_health/domain/product/product.dart';
import 'package:nano_health/module/product/widget/action_icon_container.dart';

import '../widget/bottom_sheet.dart';

class ProductDetailsScreen extends ConsumerWidget {
  final String productID;
  const ProductDetailsScreen({Key? key, required this.productID})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(getSingleProductProvider(productID));
    return Scaffold(
      body: result.when(
          data: (data) => SafeArea(
                bottom: false,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 230,
                      child: CachedNetworkImage(
                        imageUrl: data.image ?? '',
                        fit: BoxFit.contain,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 15,
                      right: 15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ActionIconContainer(
                              onPress: () {
                                Navigator.pop(context);
                              },
                              iconData: Icons.arrow_back),
                          ActionIconContainer(
                              onPress: () {}, iconData: Icons.more_vert),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: 15,
                      right: 15,
                      child: Text(
                        "Detail",
                        style: context.textTheme.headlineLarge?.copyWith(
                          color: const Color(kPrimaryColor),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: BottomSheetWidget(
                        productModel: data,
                      ),
                    ),
                  ],
                ),
              ),
          error: (error, stackTrace) => Center(
                child: Row(
                  children: [
                    Expanded(child: Text(error.toString())),
                    IconButton(
                        onPressed: () {
                          ref.refresh(getSingleProductProvider(productID));
                        },
                        icon: const Icon(
                          Icons.refresh,
                          color: Color(kPrimaryColor),
                        )),
                  ],
                ),
              ),
          loading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              )),
    );
  }
}
