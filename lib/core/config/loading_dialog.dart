import 'package:flutter/material.dart';

import '../theme/color.dart';

class LoadingDialog {
  static Future<dynamic> show(BuildContext context, Future future,
      [bool fromPayment = false]) async {
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (c) {
          final minimumSize = MediaQuery.of(context).size.width * 0.3;
          return FutureBuilder(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  //  Future(() => Navigator.pop(c));
                  Future(() {
                    Navigator.pop(c);
                    if (fromPayment == true) Navigator.pop(c);
                  });
                }
                return Dialog(
                  // The background color
                  backgroundColor: Colors.white,
                  insetPadding: EdgeInsets.symmetric(horizontal: minimumSize),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // The loading indicator
                        CircularProgressIndicator.adaptive(
                          backgroundColor: Color(kPrimaryColor),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        // Some text
                        Text('Loading...')
                      ],
                    ),
                  ),
                );
              });
        });

    try {
      return await future;
    } catch (e) {
      rethrow;
    }
  }
}
