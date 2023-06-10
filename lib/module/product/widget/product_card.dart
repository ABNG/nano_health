import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nano_health/core/util/extension.dart';
import 'package:nano_health/data/model/product_model.dart';

import '../../../core/theme/color.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;
  const ProductCard({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: productModel.image ?? '',
                    fit: BoxFit.contain,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${productModel.price} AED",
                          style: context.textTheme.titleMedium?.copyWith(
                            color: Color(kPrimaryDarkColor),
                          ),
                        ),
                        RatingBar.builder(
                          initialRating: productModel.rating?.rate ?? 0,
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          glow: false,
                          ignoreGestures: true,
                          itemSize: 25,
                          unratedColor: const Color(kunRatedStarColor),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Color(kStarColor),
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                      ],
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Text(
            productModel.title ?? '',
            style: context.textTheme.titleSmall,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            productModel.description ?? '',
            maxLines: 2,
            style: context.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
