import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_hack/utils/api.dart';
import 'package:provider/provider.dart';
import '../models/userInfo.dart';
import '../widgets/snackBars.dart';
import '../utils/routes.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Login to your account",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      EnterInfo(
                          label: "Email",
                          textController: _emailTextController,
                          valider: () {},
                          obscureText: false),
                      EnterInfo(
                        label: "Password",
                        obscureText: true,
                        valider: () {},
                        textController: _passwordTextController,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        )),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () async {
                        if (_emailTextController.value.text.isNotEmpty &&
                            _passwordTextController.value.text.isNotEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(goodSnackBar);

                          UserLogInfo(
                            _emailTextController.text,
                            _passwordTextController.text,
                            // formatDate,
                          );
                          userLog(BuildContext context, UserLogInfo logInfo) {
                            print("sent data");

                            Provider.of<ApiProvider>(context, listen: false)
                                .userLog(logInfo);
                          }

                          await Navigator.pushNamed(
                              context, MyRoutes.homeRoute);
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(badSnackBar);
                        }
                      },
                      color: Color(0xff0095FF),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      " Sign up",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 50),
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/login_img.png"),
                        fit: BoxFit.contain),
                  ),
                )
              ],
            ))
          ],
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
