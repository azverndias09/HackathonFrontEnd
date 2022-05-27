import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../Utils/routes.dart';
import '../Utils/themes.dart';
import 'package:http/http.dart' as http;
import '../models/userInfo.dart';
import 'package:intl/intl.dart';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import '../widgets/snackBars.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _passwordVerifyTextController = TextEditingController();

  // String formatDate = BirthPicker().formattedDate;

  @override
  void dispose() {
    _nameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _passwordVerifyTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(
                    "Sign up",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Create an account, It's free ",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  EnterInfo(
                      label: "Name",
                      textController: _nameTextController,
                      valider: () {},
                      obscureText: false),
                  EnterInfo(
                      label: "Email",
                      textController: _emailTextController,
                      obscureText: false,
                      valider: () {}),
                  EnterInfo(
                      label: "Password",
                      obscureText: true,
                      textController: _passwordTextController,
                      valider: () {}),
                  EnterInfo(
                      label: "Confirm Password ",
                      obscureText: true,
                      textController: _passwordVerifyTextController,
                      valider: () {}),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: const Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                    )),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () async {
                    if (_nameTextController.value.text.isNotEmpty &&
                        _emailTextController.value.text.isNotEmpty &&
                        _passwordTextController.value.text.isNotEmpty &&
                        _passwordVerifyTextController.value.text.isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(goodSnackBar);
                      UserSignInfo(
                        _nameTextController.text,
                        _emailTextController.text,
                        _passwordTextController.text,
                        // formatDate,
                      );
                      await Navigator.pushNamed(context, MyRoutes.homeRoute);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(badSnackBar);
                    }
                  },
                  color: const Color(0xff0095FF),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text("Sign up",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Already have an account?",
                      style: TextStyle(color: Colors.black)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, MyRoutes.loginRoute);
                    },
                    child: const Text(
                      " Login",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EnterInfo extends StatelessWidget {
  const EnterInfo(
      {Key? key,
      required this.label,
      required this.textController,
      required this.obscureText,
      required this.valider})
      : super(key: key);
  final String label;
  final TextEditingController textController;
  final bool obscureText;

  final Function valider;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: textController,
          style: const TextStyle(color: Colors.black),
          obscureText: obscureText,
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blueGrey,
                ),
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.blueGrey,
              ))),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
