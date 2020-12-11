import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:slider_button/slider_button.dart';
import 'package:url_launcher/url_launcher.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
  final currentOrder;
  final completedOrders;
  final Function function;
  OrdersPage({Key key, this.currentOrder, this.completedOrders, this.function})
      : super(key: key);
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 80, 30, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Active Order",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5b70d9),
              ),
            ),
            SizedBox(height: 30),
            widget.currentOrder['orderDelivered']
                ? Text(
                    "You have no active orders",
                    style: TextStyle(fontSize: 20),
                  )
                : Container(
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
                      children: [
                        ListTile(
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          title: Text(
                            widget.currentOrder["district"].toString() +
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
                              widget.currentOrder["addressLine"],
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ),
                        ),
                        ListTile(
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
                                widget.currentOrder["orderName"],
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
                                        fontSize: 16, color: Colors.grey[700]),
                                  ),
                                  Text(
                                    widget.currentOrder["orderDetails"],
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey[700]),
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
                                        fontSize: 16, color: Colors.grey[700]),
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
                            ],
                          ),
                          onTap: () {},
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 20),
                          child: Center(
                            child: SliderButton(
                              highlightedColor: Color(0xFF5b70d9),
                              vibrationFlag: true,
                              action: () {
                                setState(() {
                                  widget.currentOrder['orderDelivered'] = true;
                                  widget.completedOrders
                                      .add(widget.currentOrder);
                                });

                                orderReceived();
                              },
                              label: Text(
                                "Order Delivered",
                                style: TextStyle(
                                    color: Color(0xff4a4a4a),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17),
                              ),
                              icon: Center(
                                child: Icon(
                                  Icons.check,
                                  color: Color(0xFF5b70d9),
                                  size: 40,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
            SizedBox(height: 30),
            Text(
              "Completed Orders",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5b70d9),
              ),
            ),
            SizedBox(height: 30),
            widget.completedOrders.length == 0
                ? Text(
                    "You have no completed orders",
                    style: TextStyle(fontSize: 20),
                  )
                : Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: widget.completedOrders.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 20),
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
                          child: ListTile(
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            title: Text(
                              widget.completedOrders[index]["district"]
                                      .toString() +
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
                                widget.completedOrders[index]["addressLine"]
                                        .toString()
                                        .substring(
                                            0,
                                            widget.completedOrders[index]
                                                        ["addressLine"]
                                                    .toString()
                                                    .length ~/
                                                2) +
                                    widget.completedOrders[index]["addressLine"]
                                        .toString()
                                        .substring(
                                            (widget.completedOrders[index]
                                                            ["addressLine"]
                                                        .toString()
                                                        .length ~/
                                                    2) +
                                                1,
                                            widget.completedOrders[index]
                                                    ["addressLine"]
                                                .toString()
                                                .length)
                                        .replaceAll(
                                            new RegExp(r'[aA-zZ0-9, ]'), '*'),
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                            ),
                            trailing: Icon(SimpleLineIcons.check,
                                color: Colors.green),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Future<void> orderReceived() async {
    var url = 'https://pulsooth.az/api/admin/deliverProduct';

    Map data = {"id": widget.currentOrder['id']};

    var body = json.encode(data);
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);

    print(response.statusCode);
  }
}
