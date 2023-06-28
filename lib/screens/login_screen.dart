import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/utils/colors.dart';
import 'package:instagram/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Container(),
              flex: 2,
            ),
            SvgPicture.asset(
              'assets/ic_instagram.svg',
              height: 64,
              color: primaryColor,
            ),
            const SizedBox(
              height: 100,
            ),
            TextFieldInput(
              hintText: "Enter your email",
              textEditingController: _emailController,
              textInputType: TextInputType.emailAddress,
              ispass: false,
            ),
            SizedBox(
              height: 32,
            ),
            TextFieldInput(
              hintText: "Enter your password",
              textEditingController: _passwordController,
              textInputType: TextInputType.text,
              ispass: true,
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              child: Text('Login'),
              decoration: BoxDecoration(
                  color: blueColor,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
            Flexible(
              child: Container(),
              flex: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text("Don't have an Account?"),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      " Sign Up",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
