import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var news = [
    {
      "title": "Welcome to Pulsooth Delivery!",
      "image": "https://source.unsplash.com/5R5Trsu1aIM",
      "description":
          "We are happy to announce that Pulsooth is now providing official Delivery possibilities to everybody who wants to work with us. If you want to deliver specific products to people and make their day then you are in the right place! We welcome you to our ever-growing family! Welcome! If you have some concerns or questions about this mobile application, we recommend you check and read application manual that is located on the nearby What's New section.",
    },
    {
      "title": "Starting Manual",
      "image": "https://source.unsplash.com/gh1IgGFnhSk",
      "description":
          "Hello fellow family member! Look, this application is really simple to use. We have just 3 main categories in here: Home Page, Orders Page and Profile Page. Home Page has What's New section together with the fresh and hot orders that just appeared in the system. You can look at them, see if the delivery district is comfortable for you, choose the order and just deliver the product we will provide you to the specified address. Orders Page shows your current active order together with previous orders in any case of emergency or need in the future. Profile Page is where you can tweak and change information about yourself, your car, your profile or just check the user agreement if you are interested in them. Good luck!",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        child: Stack(
          fit: StackFit.expand,
          overflow: Overflow.visible,
          children: [
            Container(
              color: Color(0xFF5b70d9),
              width: double.infinity,
            ),
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 45,
                backgroundColor: Colors.black26,
                child: Text(
                  'IH',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 150),
                child: Text(
                  'Imran Hajiyev',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 3.3,
              right: 30,
              left: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: ListTile(
                            onTap: () {},
                            leading: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(
                                SimpleLineIcons.speedometer,
                                color: Color(0xFF5b70d9),
                              ),
                            ),
                            title: Text(
                              'My Car',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            trailing: Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(
                                SimpleLineIcons.arrow_right,
                                size: 18,
                                color: Color(0xFF5b70d9),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          indent: 20,
                          endIndent: 20,
                          color: Colors.black38,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            onTap: () {},
                            leading: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(
                                SimpleLineIcons.user_following,
                                color: Color(0xFF5b70d9),
                              ),
                            ),
                            title: Text('Account',
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            trailing: Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(
                                SimpleLineIcons.arrow_right,
                                size: 18,
                                color: Color(0xFF5b70d9),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: ListTile(
                            onTap: () {
                              _newsModalSheeet(context, 1);
                            },
                            leading: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(
                                SimpleLineIcons.feed,
                                color: Color(0xFF5b70d9),
                              ),
                            ),
                            title: Text(
                              'News',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            trailing: Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(
                                SimpleLineIcons.arrow_right,
                                size: 18,
                                color: Color(0xFF5b70d9),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          indent: 20,
                          endIndent: 20,
                          color: Colors.black38,
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Icon(
                              SimpleLineIcons.globe,
                              color: Color(0xFF5b70d9),
                            ),
                          ),
                          title: Text(
                            'Language',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          trailing: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              SimpleLineIcons.arrow_right,
                              size: 18,
                              color: Color(0xFF5b70d9),
                            ),
                          ),
                        ),
                        Divider(
                          indent: 20,
                          endIndent: 20,
                          color: Colors.black38,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            onTap: () {
                              _settingModalBottomSheet(context);
                            },
                            leading: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(
                                SimpleLineIcons.book_open,
                                color: Color(0xFF5b70d9),
                              ),
                            ),
                            title: Text(
                              'User Agreement',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            trailing: Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(
                                SimpleLineIcons.arrow_right,
                                size: 18,
                                color: Color(0xFF5b70d9),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _newsModalSheeet(context, index) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (BuildContext context) {
        return ListView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(30, 80, 30, 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.8,
                    child: Text(
                      news[index]['title'],
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5b70d9),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Chip(
                        backgroundColor: Colors.red[300],
                        avatar: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Icon(
                            SimpleLineIcons.fire,
                            size: 16,
                          ),
                        ),
                        label: Text(
                          'Hot News',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 10),
                      Chip(
                        backgroundColor: Colors.blue[300],
                        avatar: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Icon(
                            SimpleLineIcons.cursor_move,
                            size: 16,
                          ),
                        ),
                        label: Text(
                          'Scrollable',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: 10),
                  Text(
                    news[index]['description'],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),
                  Divider(
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Color(0xFF5b70d9),
                      elevation: 4.0,
                      child: Text(
                        'Got it',
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0)),
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }

  Future<void> _settingModalBottomSheet(context) async {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (BuildContext context) {
        return Wrap(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(30, 40, 30, 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.8,
                    child: Text(
                      "User Agreement",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5b70d9),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Divider(
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),
                  Divider(
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Color(0xFF5b70d9),
                      elevation: 4.0,
                      child: Text(
                        'Go Back',
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0)),
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
