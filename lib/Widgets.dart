import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class wdgets {
  static Widget newsUpdate(TextEditingController controller, IconData icon,
      String hint, int lineSize) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: TextField(
        minLines: lineSize,
        maxLines: lineSize,
        scrollPadding: EdgeInsets.all(20),
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: Icon(icon, color: Colors.grey),
          hintStyle: TextStyle(color: Colors.grey),
        ),
        controller: controller,
      ),
    );
  }


}