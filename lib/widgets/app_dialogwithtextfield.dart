import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogWithTextField {
  final String title;

  final Function()? confirmButtonAction;
  final TextEditingController textController;

  DialogWithTextField(
      {required this.title,
      required this.confirmButtonAction,
      required this.textController});

  Future showaDialog(BuildContext context) {
    if (Platform.isAndroid) {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: TextField(
            controller: textController,
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                textController.text = '';
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: confirmButtonAction,
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
    return showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: CupertinoTextField(
          controller: textController,
          autofocus: true,
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
              textController.text = '';
            },
            child: const Text('Cancel'),
          ),
          CupertinoDialogAction(
            onPressed: confirmButtonAction,
            child: const Text('OK'),
          )
        ],
      ),
    );
  }
}
