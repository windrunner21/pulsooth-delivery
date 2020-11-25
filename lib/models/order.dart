class OrdersList {
  final List<Orders> orders;

  OrdersList({
    this.orders,
  });

  factory OrdersList.fromJson(List<dynamic> parsedJson) {
    List<Orders> orders = new List<Orders>();
    orders = parsedJson.map((i) => Orders.fromJson(i)).toList();

    return new OrdersList(orders: orders);
  }
}

class Orders {
  final String id;
  final int district;
  final String addressLine;
  final String orderName;
  final String orderDetails;
  final String fid;

  Orders(
      {this.id,
      this.district,
      this.addressLine,
      this.orderName,
      this.orderDetails,
      this.fid});

  factory Orders.fromJson(Map<String, dynamic> json) {
    return new Orders(
        id: json['_id'],
        district: json['userId']['district'],
        addressLine: json['userId']['addressLine'],
        orderName: json['itemId']['enName'],
        orderDetails: json['options'][0],
        fid: json['userId']['f_id']);
  }
}
