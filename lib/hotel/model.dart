class Hotel {
  Hotel(this.id, this.name, this.description, this.address);

  Hotel.fromJSON(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String,
        description = json['description'] as String,
        address = json['address'] as String;

  int id;
  String name;
  String description;
  String address;
}
