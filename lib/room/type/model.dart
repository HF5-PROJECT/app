class RoomType {
  RoomType(
    this.id,
    this.name,
    this.size,
    this.price,
    this.supportedPeople,
    this.description,
    this.hotelId,
  );

  RoomType.fromJSON(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String,
        size = json['size'] as String,
        price = json['price'].runtimeType == int
            ? (json['price'] as int).toDouble()
            : json['price'] as double,
        supportedPeople = json['supportedPeople'] as int,
        description = json['description'] as String,
        hotelId = json['hotelId'] as int;

  int id;
  String name;
  String size;
  double price;
  int supportedPeople;
  String description;
  int hotelId;
}
