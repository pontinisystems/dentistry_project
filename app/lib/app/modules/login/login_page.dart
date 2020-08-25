import 'package:app/app/core/util/colors_util.dart';
import 'package:app/app/core/util/message.dart';
import 'package:app/app/core/util/size_utils.dart';
import 'package:app/app/core/util/strings.dart';
import 'package:app/app/core/widgets/custom_button_action.dart';
import 'package:app/app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobx/mobx.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController>
     {
  List<ReactionDisposer> _disposer;

  @override
  void dispose() {
    _disposer.forEach((dispose) => dispose());
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _disposer ??= [

      reaction((_) => controller.loginSuccess, (success) {
        if (success != null) {
          if (success) {
            Navigator.popAndPushNamed(context, '/dashboard');
          }else{

          }
        }
      }),
      reaction((_) => controller.errorMessage, (Message errorMessage) {
        //showFlushBarError(context, errorMessage);
      })
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          child: Container(
              margin: EdgeInsets.only(
                  left: 30.0, right: 30.0, bottom: 15.0, top: 15.0),
              child: Observer(builder: (_) {
                return CustomButtonAction(
                  state: controller.loading,
                  labelText: login,
                  initButtonEnable: controller.enable,
                  onClick: controller.requestLogin,
                  colorBorder: Color(colorFour),
                  colorBackground: Color(colorFour),
                  colorText: Colors.white,
                );
              })),
          elevation: 0,
        ),
        backgroundColor: Color(colorThree),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _makeHeader(),
              Observer(builder: (_) {
                return      CustomTextField(
                  state: controller.state,
                  labelText: 'Email',
                  onChanged: controller.setEmail,
                );
              }),
              Observer(builder: (_) {
                return     CustomTextField(
                  state: controller.state,

                  labelText: 'Senha',
                  obscureText: true,
                  onChanged: controller.setPassword,
                );
              }),
              _text('Forget Password'),


            ],
          ),
        ));
  }

  Widget _makeHeader() {
    return Container(
      color: Color(colorThree),
      width: SizeUtils.widthScreen,
      height: (MediaQuery.of(context).size.height * .5) -
          MediaQuery.of(context).padding.top -
          45.0,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            bottom: 40.0,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 60.0, //Tamnho
              child: SvgPicture.asset('assets/logo.svg'),
            ),
          )
        ],
      ),
    );
  }

  Container _text(String text, {Color color}) {
    return Container(
      margin: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0, top: 10.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: color != null ? color : Color(colorFour)),
        ),
      ),
    );
  }
}
