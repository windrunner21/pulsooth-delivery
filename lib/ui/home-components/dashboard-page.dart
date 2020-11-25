import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pulsooth_courier/models/order.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
  final Function function;
  DashBoardPage({Key key, this.function}) : super(key: key);
}

class _DashBoardPageState extends State<DashBoardPage> {
  bool closeWhatsNew = false;
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
      body: Column(
        children: [
          Visibility(
            visible: !closeWhatsNew,
            child: Container(
              padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),
              color: Color(0xFF5b70d9),
              height: MediaQuery.of(context).size.height / 2.8,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "What's New",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            closeWhatsNew = true;
                          });
                        },
                        iconSize: 30,
                        color: Colors.white,
                        icon: Icon(FlutterIcons.close_circle_mco),
                      )
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: news.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            _settingModalBottomSheet(context, index);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3.5,
                            margin: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0.0, 1.0),
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(news[index]['image'],
                                      fit: BoxFit.cover,
                                      width: double.infinity),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    news[index]['title'],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF5b70d9),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: !closeWhatsNew
                  ? const EdgeInsets.fromLTRB(30, 20, 30, 30)
                  : const EdgeInsets.fromLTRB(30, 60, 30, 30),
              itemCount: 2,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "New Orders For You",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5b70d9),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  );
                }
                return FutureBuilder(
                  future: getOrders(),
                  builder: (context, ordersSnapshot) {
                    if (ordersSnapshot.connectionState ==
                        ConnectionState.done) {
                      return ExpansionPanelList.radio(
                        initialOpenPanelValue: ordersSnapshot.data.orders[0].id,
                        children:
                            ordersSnapshot.data.orders.map<ExpansionPanelRadio>(
                          (order) {
                            return ExpansionPanelRadio(
                              value: order.id,
                              headerBuilder:
                                  (BuildContext context, bool isExpanded) {
                                return ListTile(
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  title: Text(
                                    districtFormatter(order.district) +
                                        " District",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Color(0xFF5b70d9),
                                    ),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      order.addressLine,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ),
                                );
                              },
                              body: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 20),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Product:",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700]),
                                    ),
                                    Text(
                                      order.orderName,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700]),
                                    ),
                                  ],
                                ),
                                subtitle: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Details:",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey[700]),
                                        ),
                                        Text(
                                          order.orderDetails,
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey[700]),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "FID:",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey[700]),
                                        ),
                                        Expanded(
                                          child: SelectableText(
                                            order.fid,
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey[700]),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                ),
                                trailing: Icon(SimpleLineIcons.plus,
                                    color: Colors.green),
                                onTap: () {
                                  _showMyDialog(order);
                                },
                              ),
                            );
                          },
                        ).toList(),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Color(0xFF5b70d9),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Future<void> _settingModalBottomSheet(context, index) async {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (BuildContext context) {
        return ListView(
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

  Future<void> _showMyDialog(order) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Order Delivery'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(order.orderName),
                SizedBox(height: 10),
                Text(districtFormatter(order.district) +
                    " District, " +
                    order.addressLine),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.grey),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Agree',
                style: TextStyle(
                  color: Color(0xFF5b70d9),
                ),
              ),
              onPressed: () {
                var orderToPass = {
                  "id": order.id,
                  "district": districtFormatter(order.district),
                  "addressLine": order.addressLine,
                  "orderName": order.orderName,
                  "orderDetails": order.orderDetails,
                  "orderDelivered": false,
                };
                widget.function(orderToPass);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<OrdersList> getOrders() async {
    var url = 'https://pulsooth.az/api/admin/getOrdersTest';

    Map data = {};

    var body = json.encode(data);
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);

    List<dynamic> ordersMap = jsonDecode(response.body);
    var orders = OrdersList.fromJson(ordersMap);

    return orders;
  }

  String districtFormatter(index) {
    switch (index) {
      case 0:
        {
          return "Binagadi";
        }
        break;
      case 1:
        {
          return "Garadagh";
        }
        break;
      case 2:
        {
          return "Khatai";
        }
        break;
      case 3:
        {
          return "Khazar";
        }
        break;
      case 4:
        {
          return "Narimanov";
        }
        break;
      case 5:
        {
          return "Nasimi";
        }
        break;
      case 6:
        {
          return "Nizami";
        }
        break;
      case 7:
        {
          return "Pirallahy";
        }
        break;
      case 8:
        {
          return "Sabail";
        }
        break;
      case 9:
        {
          return "Sabunchu";
        }
        break;
      case 10:
        {
          return "Surakhany";
        }
        break;
      case 11:
        {
          return "Yasamal";
        }
        break;
    }

    return "Error";
  }
}
