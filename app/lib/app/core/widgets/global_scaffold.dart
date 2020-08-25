import 'package:flutter/material.dart';

class GlobalScaffold {
  static final GlobalScaffold instance = GlobalScaffold();
  final scaffkey = GlobalKey<ScaffoldState>();

  void showSnackBar(Color backgroundColor, Color textColor,) {
    final snackbar = SnackBar(
        behavior: SnackBarBehavior.fixed,

        backgroundColor: backgroundColor,

        content: Container(
          child: Text(
           "asdasd",
            style: TextStyle(color: textColor),
          ),
        ));
    scaffkey.currentState.showSnackBar(snackbar);

  }




  void showSnackBarV2(BuildContext context,Color backgroundColor, Color textColor,) {
    /*Flushbar(
      duration: Duration(seconds: 2),
      backgroundGradient: LinearGradient(
        colors: [Colors.green.shade800, Colors.greenAccent.shade700],
        stops: [0.6, 1],
      ),
      backgroundColor: Colors.yellow,
      flushbarPosition: FlushbarPosition.TOP,
      title: "a1111111111sdasdad",
      message: "asdas1111111111ddsa",
    ).show(context);
*/
  }
}
