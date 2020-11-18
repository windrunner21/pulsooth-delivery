import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:slider_button/slider_button.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  var activeOrder = {
    "id": "5fafd554cfec260ca948a2ea",
    "district": "Narimanov",
    "addressLine": "A. Aliyev 26, Bina 10, Blok 2, Menzil 1015",
    "orderName": "Momkinz Diaper",
    "orderDetails": "2 | 3-6 KG",
    "orderDelivered": false,
  };

  var orders = [
    {
      "id": "5fafd554cfec260ca948a2e2",
      "district": "Yasamal",
      "addressLine": "Z. Khalilov 34, Bina 5, Blok 1, Menzil 44",
      "orderName": "Momkinz Diaper",
      "orderDetails": "2 | 3-6 KG",
      "orderDelivered": true,
    },
    {
      "id": "5fafd554cfec260ca948a2e2",
      "district": "Nasimi",
      "addressLine": "H. Asimov 12, Bina 3, Blok 10, Menzil 4",
      "orderName": "Momkinz Diaper",
      "orderDetails": "2 | 3-6 KG",
      "orderDelivered": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
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
            activeOrder['orderDelivered']
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
                            activeOrder["district"].toString() + " District",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Color(0xFF5b70d9),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              activeOrder["addressLine"],
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
                                activeOrder["orderName"],
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[700]),
                              ),
                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Details:",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[700]),
                              ),
                              Text(
                                activeOrder["orderDetails"],
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[700]),
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
                                  activeOrder['orderDelivered'] = true;
                                  orders.add(activeOrder);
                                });
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
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: orders.length,
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
                      contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      title: Text(
                        orders[index]["district"].toString() + " District",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0xFF5b70d9),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          orders[index]["addressLine"].toString().substring(
                                  0,
                                  orders[index]
                                              ["addressLine"]
                                          .toString()
                                          .length ~/
                                      2) +
                              orders[index]
                                      ["addressLine"]
                                  .toString()
                                  .substring(
                                      (orders[index]["addressLine"]
                                                  .toString()
                                                  .length ~/
                                              2) +
                                          1,
                                      orders[index]["addressLine"]
                                          .toString()
                                          .length)
                                  .replaceAll(new RegExp(r'[aA-zZ0-9, ]'), '*'),
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                      trailing:
                          Icon(SimpleLineIcons.check, color: Colors.green),
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
}
