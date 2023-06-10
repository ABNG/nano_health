import 'package:flutter/material.dart';
import 'package:nano_health/core/util/extension.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordField({Key? key, required this.controller}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: !showPassword,
      obscuringCharacter: '*',
      textInputAction: TextInputAction.done,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Required';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: context.textTheme.labelMedium,
        floatingLabelStyle: context.textTheme.displaySmall,
        suffix: showPassword
            ? IconButton(
                icon: const Icon(
                  Icons.visibility_off,
                  color: Colors.black26,
                ),
                onPressed: () {
                  setState(() {
                    showPassword = false;
                  });
                },
              )
            : IconButton(
                icon: const Icon(
                  Icons.visibility,
                  color: Colors.black26,
                ),
                onPressed: () {
                  setState(() {
                    showPassword = true;
                  });
                },
              ),
      ),
    );
  }
}
