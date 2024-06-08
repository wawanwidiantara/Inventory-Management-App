class Supplier {
  String? id;
  String? name;
  String? contactPerson;
  String? whatsapp;
  String? address;

  Supplier(
      {this.id, this.name, this.contactPerson, this.whatsapp, this.address});

  Supplier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    contactPerson = json['contactPerson'];
    whatsapp = json['whatsapp'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['contactPerson'] = contactPerson;
    data['whatsapp'] = whatsapp;
    data['address'] = address;
    return data;
  }
}
