import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_hack/utils/api.dart';
import 'package:provider/provider.dart';
import '../widgets/snackBars.dart';
import '../utils/routes.dart';

class ResetPage extends StatelessWidget {
  ResetPage({Key? key}) : super(key: key);
  TextEditingController _OtpTextController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();

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
                      "Reset Password",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      EnterInfo(
                          label: "OTP",
                          textController: _OtpTextController,
                          valider: () {},
                          obscureText: false),
                      EnterInfo(
                          label: "New Password",
                          textController: _newPasswordController,
                          valider: () {},
                          obscureText: true),
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
                        if (_OtpTextController.value.text.isNotEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(goodSnackBar("Done"));

                          Provider.of<ApiProvider>(context, listen: false)
                              .resetConfirm(
                            _OtpTextController.text,
                            _newPasswordController.text,
                          )
                              .then((value) {
                            print("msg value is --$value");
                            if (value == "Password changed successfull") {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(goodSnackBar(value));
                              Navigator.pushNamed(context, MyRoutes.loginRoute);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(badSnackBar(value));
                            }
                          });
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(badSnackBar("Not Done"));
                        }
                      },
                      color: Color(0xff0095FF),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Text(
                        "Reset Password",
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
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, MyRoutes.signupRoute);
                        },
                        child: const Text(
                          " Sign up",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        )),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 50),
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
