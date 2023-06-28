// import 'dart:js_interop';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:instagram/resources/auth_methods.dart';
// import 'package:instagram/utils/utils..dart';

// import '../utils/colors.dart';
// import '../widgets/text_field_input.dart';

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({Key? key}) : super(key: key);

//   @override
//   _SignupScreenState createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _bioController = TextEditingController();
//   Uint8List _image;

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _emailController..dispose();
//     _passwordController.dispose();
//     _usernameController.dispose();
//     _bioController..dispose();
//   }

//   void selectImage() async {
//     Uint8List im = await pickImage(ImageSource.gallery);
//     print('success');
//     setState(() {
      
//       _image =  im;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 32),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Flexible(
//                 child: Container(),
//                 flex: 2,
//               ),
//               SvgPicture.asset(
//                 'assets/ic_instagram.svg',
//                 height: 64,
//                 color: primaryColor,
//               ),
//               const SizedBox(
//                 height: 70,
//               ),
//               TextFieldInput(
//                 hintText: "Enter your username",
//                 textEditingController: _usernameController,
//                 textInputType: TextInputType.text,
//                 ispass: false,
//               ),
//               SizedBox(
//                 height: 25,
//               ),
//               TextFieldInput(
//                 hintText: "Enter your email",
//                 textEditingController: _emailController,
//                 textInputType: TextInputType.emailAddress,
//                 ispass: false,
//               ),
//               SizedBox(
//                 height: 25,
//               ),
//               TextFieldInput(
//                 hintText: "Enter your password",
//                 textEditingController: _passwordController,
//                 textInputType: TextInputType.text,
//                 ispass: true,
//               ),
//               const SizedBox(
//                 height: 25,
//               ),
//               TextFieldInput(
//                 hintText: "Enter your bio",
//                 textEditingController: _bioController,
//                 textInputType: TextInputType.text,
//                 ispass: false,
//               ),
//               const SizedBox(
//                 height: 25,
//               ),
//               GestureDetector(
//                 onTap: () async {
//                   await AuthMethods().signUpUser(
//                       bio: _bioController.text,
//                       username: _usernameController.text,
//                       password: _passwordController.text,
//                       email: _emailController.text);
//                 },
//                 child: Container(
//                   width: double.infinity,
//                   padding: EdgeInsets.symmetric(vertical: 12),
//                   alignment: Alignment.center,
//                   child: Text('Sign Up'),
//                   decoration: BoxDecoration(
//                       color: blueColor,
//                       borderRadius: BorderRadius.all(Radius.circular(8))),
//                 ),
//               ),
//               Flexible(
//                 child: Container(),
//                 flex: 2,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     padding: EdgeInsets.symmetric(vertical: 8),
//                     child: Text("Already have account?"),
//                   ),
//                   GestureDetector(
//                     onTap: () {},
//                     child: Container(
//                       padding: EdgeInsets.symmetric(vertical: 8),
//                       child: Text(
//                         " Login",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
