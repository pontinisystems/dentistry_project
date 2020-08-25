import 'package:app/app/core/util/store_state.dart';
import 'package:flutter/material.dart';

class CustomButtonAction extends StatelessWidget {
  final String labelText;
  final Function() onClick;
  final Color colorBorder;
  final Color colorBackground;
  final Color colorText;
  final double width;
  final double height;
  final bool initButtonEnable;
  final StoreState state;
  CustomButtonAction({
    Key key,
    this.labelText,
    this.onClick,
    this.colorBorder,
    this.colorBackground,
    this.colorText,
    this.width,
    this.height,
    this.initButtonEnable, this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _customButton() {
      return Stack(
        alignment: Alignment.center,
        children: <Widget>[

          state ==StoreState.loading ?
          CircularProgressIndicator(

          ):SizedBox(),
          Opacity(
              opacity:   state ==StoreState.loading || initButtonEnable ==false?  0.50 :1,
              child: Container(
                width:
                    width != null ? width : MediaQuery.of(context).size.width,
                height: height != null ? height : 45.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: colorBorder)),
                  color: colorBackground,
                  textColor: colorText,
                  padding: EdgeInsets.all(8.0),
                  onPressed:  state !=StoreState.loading && initButtonEnable ==true ? onClick : () {
                    print("object");
                  },
                  child: state ==StoreState.loading ?

                 SizedBox(): Text(
                    labelText.toUpperCase(),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              )),
        ],
      );
    }

    return _customButton();
  }

  whatToDoOnPressed() {}
}
