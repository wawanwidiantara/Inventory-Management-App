class User {
  String? id;
  String? whatsapp;
  String? name;

  User({this.id, this.whatsapp, this.name});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    whatsapp = json['whatsapp'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['whatsapp'] = whatsapp;
    data['name'] = name;
    return data;
  }
}
