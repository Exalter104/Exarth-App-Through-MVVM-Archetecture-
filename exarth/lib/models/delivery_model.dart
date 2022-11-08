// ignore_for_file: no_leading_underscores_for_local_identifiers

class DeliverListModel {
  int? count;
  dynamic next;
  dynamic previous;
  List<Results>? results;

  DeliverListModel({this.count, this.next, this.previous, this.results});

  DeliverListModel.fromJson(Map<String, dynamic> json) {
    count = json["count"];
    next = json["next"];
    previous = json["previous"];
    results = json["results"] == null
        ? null
        : (json["results"] as List).map((e) => Results.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["count"] = count;
    _data["next"] = next;
    _data["previous"] = previous;
    if (results != null) {
      _data["results"] = results?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Results {
  int? id;
  Order? order;
  String? acceptedOn;

  Results({this.id, this.order, this.acceptedOn});

  Results.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    order = json["order"] == null ? null : Order.fromJson(json["order"]);
    acceptedOn = json["accepted_on"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    if (order != null) {
      _data["order"] = order?.toJson();
    }
    _data["accepted_on"] = acceptedOn;
    return _data;
  }
}

class Order {
  String? id;
  String? paymentType;
  double? distance;
  String? status;
  FkCustomer? fkCustomer;
  String? created;
  String? fkWarehouse;

  Order(
      {this.id,
      this.paymentType,
      this.distance,
      this.status,
      this.fkCustomer,
      this.created,
      this.fkWarehouse});

  Order.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    paymentType = json["payment_type"];
    distance = json["distance"];
    status = json["status"];
    fkCustomer = json["fk_customer"] == null
        ? null
        : FkCustomer.fromJson(json["fk_customer"]);
    created = json["created"];
    fkWarehouse = json["fk_warehouse"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["payment_type"] = paymentType;
    _data["distance"] = distance;
    _data["status"] = status;
    if (fkCustomer != null) {
      _data["fk_customer"] = fkCustomer?.toJson();
    }
    _data["created"] = created;
    _data["fk_warehouse"] = fkWarehouse;
    return _data;
  }
}

class FkCustomer {
  String? firstName;
  String? lastName;
  String? email;
  String? username;
  dynamic location;

  FkCustomer(
      {this.firstName,
      this.lastName,
      this.email,
      this.username,
      this.location});

  FkCustomer.fromJson(Map<String, dynamic> json) {
    firstName = json["first_name"];
    lastName = json["last_name"];
    email = json["email"];
    username = json["username"];
    location = json["location"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["first_name"] = firstName;
    _data["last_name"] = lastName;
    _data["email"] = email;
    _data["username"] = username;
    _data["location"] = location;
    return _data;
  }
}
