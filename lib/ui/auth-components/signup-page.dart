import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pulsooth_courier/classes/phone-number-formatter.dart';
import 'package:pulsooth_courier/classes/social-id-formatter.dart';
import 'package:pulsooth_courier/ui/auth-components/verify-page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // key to check the sign in form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final fullname = TextEditingController();
  final socialId = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    fullname.dispose();
    socialId.dispose();
    phoneNumber.dispose();
    password.dispose();
    super.dispose();
  }

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
          child: ListView(
            children: [
              Text(
                "Create account",
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
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                      autofocus: true,
                      controller: fullname,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        hintText: "Name Surname",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.black54),
                        prefixIcon: Icon(
                          SimpleLineIcons.user,
                          color: Color(0xFF364DB9),
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter your social indentity number';
                        }
                        return null;
                      },
                      controller: socialId,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Social Identity Number',
                        prefixIcon: Icon(
                          FlutterIcons.identifier_mco,
                          color: Color(0xFF364DB9),
                        ),
                        hintText: "xxxx xxxx",
                        prefixText: "AZE ",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.black54),
                      ),
                      inputFormatters: [
                        SocialIdFormatter(
                          mask: 'xxxx xxxx',
                          separator: ' ',
                        ),
                      ],
                    ),
                    TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      controller: phoneNumber,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        hintText: '(xx) xxx xx xx',
                        prefixText: "+994 ",
                        prefixIcon: Icon(
                          SimpleLineIcons.screen_smartphone,
                          color: Color(0xFF364DB9),
                        ),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.black54),
                      ),
                      inputFormatters: [
                        PhoneNumberFormatter(
                          mask: 'xx xxx xx xx',
                          separator: ' ',
                        ),
                      ],
                    ),
                    TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      controller: password,
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
                    if (_formKey.currentState.validate()) {
                      var finalPhoneNumber =
                          '+994' + phoneNumber.text.replaceAll(" ", "");

                      var userSignUpInfo = {
                        'fullname': fullname.text,
                        'socialId': socialId.text,
                        'phoneNumber': finalPhoneNumber,
                        'password': password.text,
                      };

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              VerifyPhonePage(object: userSignUpInfo),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Sign Up",
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
