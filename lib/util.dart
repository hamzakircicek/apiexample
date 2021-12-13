import 'package:flutter/material.dart';
class Snacbar{
  SnackBar Snackbar(BuildContext context,String message){
    return SnackBar(content: Text(message),
      duration: Duration(milliseconds: 750),
      backgroundColor: Colors.grey.shade800.withOpacity(0.9),
      action: SnackBarAction(label: "Kapat",  onPressed:(){

      }),
    );
  }

}