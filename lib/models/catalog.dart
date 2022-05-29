class CatalogModel {
  static List<Item> products = [];
}

class Item {
  final num id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String imgUrl;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.imgUrl});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        color: map["color"],
        imgUrl: map["imgUrl"]);
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "imgUrl": imgUrl
      };
}
