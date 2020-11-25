import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pulsooth_courier/ui/home-components/dashboard-page.dart';
import 'package:pulsooth_courier/ui/home-components/orders-page.dart';
import 'package:pulsooth_courier/ui/home-components/profile-page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var completedOrders = [];
  var currentOrder = {
    "placeHolder": "placeHolder",
    "orderDelivered": true,
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            DashBoardPage(
              function: function,
            ),
            OrdersPage(
              currentOrder: currentOrder,
              completedOrders: completedOrders,
              function: function2,
            ),
            ProfilePage()
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: TabBar(
            labelColor: Color(0xFF364DB9),
            unselectedLabelColor: Colors.grey,
            labelPadding: EdgeInsets.fromLTRB(10, 0, 10, 25),
            indicator: BoxDecoration(),
            tabs: [
              Tab(
                icon: Icon(SimpleLineIcons.layers),
                text: 'Home',
              ),
              Tab(
                icon: Icon(SimpleLineIcons.directions),
                text: 'Orders',
              ),
              Tab(
                icon: Icon(SimpleLineIcons.user),
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  function(value) => setState(() => currentOrder = value);
  function2(value) => setState(() => completedOrders = value);
}
