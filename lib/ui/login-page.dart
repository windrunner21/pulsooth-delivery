import 'package:flutter/material.dart';
import 'package:pulsooth_courier/ui/auth-components/signin-page.dart';
import 'package:pulsooth_courier/ui/auth-components/signup-page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.4, 0.6, 0.9],
            colors: [
              Color(0xFF4D69EE),
              Color(0xFF715DF4),
              Color(0xFF746aeb),
              Color(0xFF80b8f3)
            ], //#4D69EE, #715DF4, 746aeb, 80b8f3
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  "Deliver and share Pulsooth products",
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Log In",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  color: Color(0xFF5b70d9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
