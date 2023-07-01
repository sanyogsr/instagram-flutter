import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/resources/auth_methods.dart';
import 'package:instagram/responnsive/mobile_screen_Layout.dart';
import 'package:instagram/responnsive/responsive_layout_screen.dart';
import 'package:instagram/responnsive/web_screen_layout.dart';
import 'package:instagram/screens/login_screen.dart';
import 'package:instagram/utils/utils..dart';

import '../utils/colors.dart';
import '../widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  bool _isLoading = false;
  Uint8List? _image;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _bioController.dispose();
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });

    //signup the user using authmethods
    String res = await AuthMethods().signUpUser(
        email: _emailController.text,
        username: _usernameController.text,
        bio: _bioController.text,
        password: _passwordController.text,
        file: _image!);

    if (res != "success") {
      showSnackBar(context, res);
      setState(() {
        _isLoading = false;
      });
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const ResponsiveLayoutScreen(
              mobileScreenLayout: MobileScreenLayout(),
              webScreenLayout: WebScreenLayout())));
    }
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    print('success');
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Container(),
              ),
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                height: 64,
                color: primaryColor,
              ),
              const SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          backgroundImage: MemoryImage(_image!),
                          radius: 65,
                          backgroundColor: Colors.red,
                        )
                      : const CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                              "https://i.stack.imgur.com/l60Hf.png"),
                          radius: 65,
                        ),
                  Positioned(
                      left: 80,
                      bottom: -10,
                      child: IconButton(
                        icon: const Icon(
                          Icons.add_a_photo,
                        ),
                        onPressed: selectImage,
                      ))
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              TextFieldInput(
                hintText: "Enter your username",
                textEditingController: _usernameController,
                textInputType: TextInputType.text,
                ispass: false,
              ),
              const SizedBox(
                height: 25,
              ),
              TextFieldInput(
                hintText: "Enter your email",
                textEditingController: _emailController,
                textInputType: TextInputType.emailAddress,
                ispass: false,
              ),
              const SizedBox(
                height: 25,
              ),
              TextFieldInput(
                hintText: "Enter your password",
                textEditingController: _passwordController,
                textInputType: TextInputType.text,
                ispass: true,
              ),
              const SizedBox(
                height: 25,
              ),
              TextFieldInput(
                hintText: "Enter your bio",
                textEditingController: _bioController,
                textInputType: TextInputType.text,
                ispass: false,
              ),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: signUpUser,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text('Sign Up'),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text("Already have account?"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        " Login",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
