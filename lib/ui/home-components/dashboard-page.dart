import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pulsooth_courier/models/order.dart';
import 'package:url_launcher/url_launcher.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
  final Function function;
  DashBoardPage({Key key, this.function}) : super(key: key);
}

class _DashBoardPageState extends State<DashBoardPage> {
  bool closeWhatsNew = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        backgroundColor: Color(0xFF5b70d9),
        onRefresh: getData,
        child: ListView.builder(
          padding: EdgeInsets.fromLTRB(30, 80, 30, 30),
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
                if (ordersSnapshot.connectionState == ConnectionState.done) {
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
                                districtFormatter(order.district) + " District",
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Product:",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey[700]),
                                ),
                                Text(
                                  order.orderName,
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey[700]),
                                ),
                              ],
                            ),
                            subtitle: Column(
                              children: [
                                SizedBox(height: 5),
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
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Contact Info:",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700]),
                                    ),
                                    RaisedButton.icon(
                                      onPressed: () =>
                                          launch("tel://+994517807929"),
                                      color: Colors.white,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(
                                          color: Color(0xFF364DB9),
                                        ),
                                      ),
                                      icon: Icon(
                                        SimpleLineIcons.phone,
                                        size: 20,
                                        color: Color(0xFF364DB9),
                                      ),
                                      label: Text(
                                        'Call',
                                        style: TextStyle(
                                          color: Color(0xFF364DB9),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'To confirm order press on tile',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[700]),
                                ),
                                SizedBox(height: 15),
                              ],
                            ),
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
      ),
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

  Future<void> getData() {
    setState(() {});
    return getOrders();
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
