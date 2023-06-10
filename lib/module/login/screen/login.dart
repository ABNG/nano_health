import 'package:flutter/material.dart';
import 'package:nano_health/core/util/extension.dart';
import 'package:nano_health/module/login/view/body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ScrollController controller = ScrollController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = (MediaQuery.of(context).size.width / 2);
    return Scaffold(
      body: CustomScrollView(
        controller: controller,
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 380,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              titlePadding: const EdgeInsets.only(left: 36, bottom: 20),
              title: Text(
                'Log In',
                style: context.textTheme.displayLarge,
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF188095),
                      Color(0xFF2AB3C6),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Center(
                  child: RepaintBoundary(
                    child: AnimatedBuilder(
                        animation: controller,
                        child: Image.asset(
                          'assets/logo.png',
                          fit: BoxFit.cover,
                          width: 240,
                        ),
                        builder: (context, child) {
                          final opacity = (controller.offset / width)
                              .clamp(0, 1)
                              .toDouble();
                          return AnimatedOpacity(
                            opacity: 1 - opacity,
                            duration: const Duration(milliseconds: 250),
                            child: child,
                          );
                        }),
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 57,
                ),
                Body(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
