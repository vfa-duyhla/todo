import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewAlertDialog {
  final String title;
  final Function() confirmButtonAction;

  NewAlertDialog({required this.title, required this.confirmButtonAction});

  Future showaDialog(BuildContext context) {
    if (Platform.isAndroid) {
      // Android-specific code
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: confirmButtonAction,
              child: const Text('Yes'),
            )
          ],
          elevation: 24.0,
        ),
      );
    }
    // iOS-specific code
    return showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context),
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            onPressed: confirmButtonAction,
            child: const Text('Yes'),
          )
        ],
      ),
    );
  }
}
