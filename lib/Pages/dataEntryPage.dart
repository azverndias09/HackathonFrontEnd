import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:health_hack/utils/api.dart';
import 'package:provider/provider.dart';
import '../utils/routes.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:google_fonts/google_fonts.dart  ';
import '../widgets/snackBars.dart';

bool finalIsMale = false, hasChosen = false;
double finalHeight = 143;
int finalWeight = 60;
bool Smoked = false;
bool Drunk = false;
String dobString = '';
late String gender;

class DataEntryPage extends StatefulWidget {
  const DataEntryPage({Key? key}) : super(key: key);

  @override
  State<DataEntryPage> createState() => _DataEntryPageState();
}

class _DataEntryPageState extends State<DataEntryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 190, 23, 220),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: MediaQuery.of(context).size.height.toDouble() / 1.2,
            width: MediaQuery.of(context).size.width.toDouble(),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.transparent),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            GenderCard(isMale: true),
                            Text("Male"),
                          ],
                        ),
                        Column(
                          children: [
                            GenderCard(isMale: false),
                            Text("Female"),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        BirthPicker(),
                        Text("Choose DOB"),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        margin: const EdgeInsets.all(20.0),
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.purpleAccent)),
                        child: const HeightScroller()),
                    Container(
                        margin: const EdgeInsets.all(20.0),
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.purpleAccent)),
                        child: WeightScroller())
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Do you smoke?"),
                          isSmoking(),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text("Do you consume alcoholic drinks?"),
                        isDrinking(),
                      ],
                    ),
                  ],
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
                        if (dobString != '' && hasChosen == true) {
                          print("not empty");

                          gender = finalIsMale ? "Male" : "Female";
                          Provider.of<ApiProvider>(context, listen: false)
                              .sendHealth(finalHeight, finalWeight, Smoked,
                                  Drunk, dobString, gender);
                          await Navigator.pushNamed(
                              context, MyRoutes.dashRoute);
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(badSnackBar("Enter All the Data!"));
                        }
                      },
                      color: Color(0xff0095FF),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GenderCard extends StatefulWidget {
  GenderCard({Key? key, required this.isMale}) : super(key: key);
  bool isMale = false;

  @override
  State<GenderCard> createState() => _GenderCardState();
}

class _GenderCardState extends State<GenderCard> {
  Color _iconColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: (() {
          hasChosen = true;
          setState(() {
            _iconColor = Colors.purple;
          });

          finalIsMale = widget.isMale ? true : false;
        }),
        child: Card(
          child: SizedBox(
            height: 50,
            width: 50,
            child: widget.isMale
                ? Icon(Icons.male, color: _iconColor)
                : Icon(Icons.female, color: _iconColor),
          ),
        ),
      ),
    );
  }
}

class HeightScroller extends StatefulWidget {
  const HeightScroller({Key? key}) : super(key: key);

  @override
  _NumberScrollerState createState() => _NumberScrollerState();
}

class _NumberScrollerState extends State<HeightScroller> {
  int _currentValue = 143;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NumberPicker(
          value: _currentValue,
          minValue: 0,
          maxValue: 300,
          onChanged: (value) => setState(() {
            _currentValue = value;
            finalHeight = value.toDouble();
          }),
        ),
        Text('Height: $_currentValue.0 cms'),
      ],
    );
  }
}

class WeightScroller extends StatefulWidget {
  @override
  WeightScrollerState createState() => WeightScrollerState();
}

class WeightScrollerState extends State<WeightScroller> {
  int _currentValue = 60;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NumberPicker(
          value: _currentValue,
          minValue: 0,
          maxValue: 200,
          onChanged: (value) => setState(() {
            _currentValue = value;
            finalWeight = value;
          }),
        ),
        Text('Weight: $_currentValue Kgs'),
      ],
    );
  }
}

class isSmoking extends StatefulWidget {
  isSmoking({Key? key}) : super(key: key);

  @override
  State<isSmoking> createState() => isSmokingState();
}

class isSmokingState extends State<isSmoking> {
  bool isSmoked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Switch(
        value: isSmoked,
        onChanged: (value) {
          setState(() {
            isSmoked = value;
            Smoked = isSmoked;
            print(isSmoked);
          });
        },
        inactiveThumbColor: Colors.purpleAccent,
        inactiveTrackColor: Colors.black,
        activeTrackColor: Colors.purpleAccent,
        activeColor: Colors.purple,
      ),
    );
  }
}

class isDrinking extends StatefulWidget {
  isDrinking({Key? key}) : super(key: key);

  @override
  State<isDrinking> createState() => isDrinkingState();
}

class isDrinkingState extends State<isDrinking> {
  bool isDrunk = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Switch(
        value: isDrunk,
        onChanged: (value) {
          setState(() {
            isDrunk = value;
            Drunk = isDrunk;
            print(isDrunk);
          });
        },
        inactiveThumbColor: Colors.purpleAccent,
        inactiveTrackColor: Colors.black,
        activeTrackColor: Colors.purpleAccent,
        activeColor: Colors.purple,
      ),
    );
  }
}

class BirthPicker extends StatelessWidget {
  BirthPicker({Key? key}) : super(key: key);
  final DateTime date = DateTime.now();
  String formattedDate = '';

  String sendFormattedDate() {
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(),
        onPressed: () async {
          DateTime? dob = await showDatePicker(
              context: context,
              initialDate: date,
              firstDate: DateTime(1900),
              lastDate: DateTime.now());
          if (dob != null) {
            formattedDate = DateFormat('yyyy-MM-dd').format(dob);
            print(formattedDate);
            dobString = formattedDate;
          }
        },
        child: Icon(Icons.calendar_month_outlined));
  }
}
