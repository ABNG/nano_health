import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nano_health/core/util/extension.dart';
import 'package:nano_health/data/model/product_model.dart';

import '../../../core/theme/color.dart';
import '../../../shared/common_button.dart';

class BottomSheetWidget extends StatefulWidget {
  final ProductModel productModel;
  const BottomSheetWidget({Key? key, required this.productModel})
      : super(key: key);

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            "${widget.productModel.price} AED",
            style: context.textTheme.titleLarge,
          ),
        ),
        AnimatedContainer(
          height: isExpanded ? 350 : 230,
          duration: const Duration(milliseconds: 500),
          child: GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Container(
              height: 350,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35),
                    topLeft: Radius.circular(35)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 0,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                physics:
                    isExpanded ? null : const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_up,
                      color: const Color(kPrimaryColor),
                      size: 32,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 1,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: IconButton(
                            icon: SvgPicture.asset('assets/svg/share.svg'),
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(
                            child: CommonButton(
                          text: 'Order Now',
                          height: 54,
                          borderRadius: 43,
                          onPress: () {},
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      'Description',
                      style: context.textTheme.titleSmall,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.productModel.description ?? '',
                      style: context.textTheme.bodySmall?.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 20),
                      padding: const EdgeInsets.only(
                          top: 5, left: 5, right: 20, bottom: 25),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F1F1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Review (${widget.productModel.rating?.count ?? 0})",
                            style: context.textTheme.bodyMedium,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 30),
                            child: Row(
                              children: [
                                Text(
                                  "${widget.productModel.rating?.rate ?? 0}",
                                  style: context.textTheme.bodyLarge,
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                RatingBar.builder(
                                  initialRating:
                                      widget.productModel.rating?.rate ?? 0,
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
