import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/api.dart';
import '../utils/routes.dart';
import '../widgets/snackBars.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({Key? key}) : super(key: key);

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  Widget _body = Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      SizedBox(
        width: 100,
      ),
      MyCardWidget(
        myIcon: Icons.favorite,
        titleName: "ECG",
        subtitle: "55 BPM",
      ),
      MyCardWidget(
        myIcon: Icons.health_and_safety,
        titleName: "GLUCOSE",
        subtitle: "140 mg/dL",
      ),
      MyCardWidget(
        myIcon: Icons.personal_injury_rounded,
        titleName: "Cardiograph",
        subtitle: "13-17 mm/m2",
      ),
      _MyButton(),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Analysis Data"),
      ),
      body: _body,
    );
  }
}

class _MyButton extends StatelessWidget {
  const _MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        padding: EdgeInsets.only(top: 3, left: 3),
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
            // Provider.of<ApiProvider>(context, listen: false).getAnalytic();
            ScaffoldMessenger.of(context).showSnackBar(
                goodSnackBar("Running Algorithm To Find Best Policies"));
            Navigator.pushNamed(context, MyRoutes.mainRoute);
          },
          color: Color(0xff0095FF),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Text(
            "Find Policies",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class MyCardWidget extends StatelessWidget {
  const MyCardWidget(
      {Key? key,
      required this.titleName,
      required this.subtitle,
      required this.myIcon})
      : super(key: key);
  final IconData myIcon;
  final String titleName;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 300,
      height: 150,
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.red,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Icon(myIcon, size: 60),
                  title: Text(
                    titleName,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(subtitle,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500)),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
