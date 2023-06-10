import 'package:flutter/material.dart';
import 'package:nano_health/core/util/extension.dart';

import '../../../shared/decorated_box_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBoxWidget(
      radius: 35,
      child: ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35)),
          child: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              "All Products",
              style: context.textTheme.headlineLarge,
            ),
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
}
