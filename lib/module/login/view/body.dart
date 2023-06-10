import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nano_health/core/config/custom_snackbar.dart';
import 'package:nano_health/core/config/loading_dialog.dart';
import 'package:nano_health/core/util/extension.dart';
import 'package:nano_health/domain/login/auth.dart';
import 'package:nano_health/module/login/widget/email_field.dart';
import 'package:nano_health/shared/common_button.dart';

import '../../bottom_navigation/screen/bottom_navbar_screen.dart';
import '../widget/password_field.dart';

class Body extends ConsumerStatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  ConsumerState<Body> createState() => _BodyState();
}

class _BodyState extends ConsumerState<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    if (kDebugMode) {
      emailController.text = "mor_2314";
      passwordController.text = "83r5^_";
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 42.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            EmailField(controller: emailController),
            const SizedBox(
              height: 32,
            ),
            PasswordField(
              controller: passwordController,
            ),
            const SizedBox(
              height: 24,
            ),
            CommonButton(
              text: "Continue",
              onPress: () async {
                if (_formKey.currentState!.validate()) {
                  final data = {
                    "username": emailController.text,
                    "password": passwordController.text,
                  };
                  final future = ref.read(loginUserProvider(data).future);
                  try {
                    String token = await LoadingDialog.show(context, future);
                    if (mounted) {
                      context.pushAndRemoveUntil(const BottomNavbarScreen());
                    }
                  } catch (e) {
                    CustomSnackBar.show(context, e.toString());
                    print(e.toString());
                  }
                }
              },
            ),
            const SizedBox(
              height: 43,
            ),
            Text(
              "NEED HELP?",
              style: context.textTheme.displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}
