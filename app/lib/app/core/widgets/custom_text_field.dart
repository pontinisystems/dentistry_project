import 'package:app/app/core/util/colors_util.dart';
import 'package:app/app/core/util/store_state.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final Function() errorText;
  final bool obscureText;
  final StoreState state;
  Function(String value) onChanged;

  final Icon icon;
  CustomTextField(
      {Key key,
      this.labelText,
      this.errorText,
      this.onChanged,
      this.icon,
      this.state,
      this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.only(left: 34.0, right: 34.0, bottom: 10.0),
        child: TextField(
          autofocus: false,
            enabled: state == StoreState.loading ? false:true,
            obscureText: obscureText == null ? false : obscureText,
            onChanged: (newValue) {
              onChanged(newValue);
            },
            decoration: InputDecoration(
                prefixIcon: icon,
                enabledBorder: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide:
                      const BorderSide(color: Color(field_color), width: 1.0),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(field_color), width: 1.0),
                ),
                labelText: labelText,
                labelStyle: TextStyle(fontSize: 16.0, color: Color(label_color)),
                errorText: errorText == null ? null : errorText())));
  }
}
