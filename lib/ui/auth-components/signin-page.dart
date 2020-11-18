import 'package:flutter/material.dart';
import 'package:pulsooth_courier/ui/auth-components/forgot-password-page.dart';
import 'package:pulsooth_courier/ui/home-page.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // key to check the sign in form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5b70d9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.fromLTRB(20, 10, 20, 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Social Identity Number',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.black54),
                        prefixText: "AZE ",
                        prefixIcon: Icon(
                          FlutterIcons.identifier_mco,
                          color: Color(0xFF364DB9),
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.black54),
                        prefixIcon: Icon(
                          SimpleLineIcons.lock,
                          color: Color(0xFF364DB9),
                        ),
                        suffix: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Forgot?',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
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
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  child: Text(
                    "Log In",
                    style: TextStyle(fontSize: 15, color: Colors.black),
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
