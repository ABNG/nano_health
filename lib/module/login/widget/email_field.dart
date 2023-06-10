import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nano_health/core/util/extension.dart';

class EmailField extends StatefulWidget {
  final TextEditingController controller;
  const EmailField({Key? key, required this.controller}) : super(key: key);

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Required';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: context.textTheme.labelMedium,
        floatingLabelStyle: context.textTheme.displaySmall,
        suffix: SvgPicture.asset(
          'assets/svg/email_valid.svg',
          fit: BoxFit.cover,
          height: 14.29,
        ),
      ),
    );
  }
}
