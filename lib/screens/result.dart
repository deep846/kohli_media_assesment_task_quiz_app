import 'package:flutter/material.dart';
// import 'package:quizzler/screens/main.dart';
class result extends StatelessWidget {
  int r;
  String s;
  result(int res)
  {
    this.r = res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          //resizeToAvoidBottomInset: false;
          image: DecorationImage(
            // matchTextDirection: true,
            image: AssetImage("lib/images/16.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  "Congratulations, you get ${this.r} Point",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 35.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                child: Padding(
                  padding: EdgeInsets.all(14),
                  child: Text(
                    "Restart",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
