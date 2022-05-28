import 'package:flutter/material.dart';
import 'package:health_hack/utils/routes.dart';
import 'package:provider/provider.dart';
import 'package:health_hack/utils/api.dart';
import '../widgets/snackBars.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Device Data"),
      ),
      backgroundColor: Color(0xffA85CF9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ImageCard(assetName: 'assets/images/bargraph.png', scale: 1.3),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 110,
              ),
              ImageCard(assetName: 'assets/images/pieChart.png', scale: 3.2),
            ],
          ),
          Row(
            children: [
              ImageCard(
                  assetName: 'assets/images/mountainGraph.png', scale: 3.3),
              SizedBox(
                width: 100,
              ),
            ],
          ),
          _MyButton(),
        ],
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  const ImageCard({Key? key, required this.assetName, required this.scale})
      : super(key: key);
  final String assetName;
  final double scale;
  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Image.asset(
        assetName,
        scale: scale,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
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
            //Provider.of<ApiProvider>(context, listen: false).getAnalytic();
            ScaffoldMessenger.of(context).showSnackBar(
                goodSnackBar("Data Analayzed and sent to calculator!"));
            Navigator.pushNamed(context, MyRoutes.analyticRoute);
          },
          color: Color(0xff0095FF),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Text(
            "Analyze Data",
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
