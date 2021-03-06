import 'package:basics/models/catalog.dart';
import "package:flutter/material.dart";

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      child: Card(
        child: ListTile(
          onTap: () {},
          leading: Image.network(item.imgUrl),
          title: Text(item.name),
          subtitle: Text(item.desc),
          trailing: Text(
            "\$${item.price.toString()}",
            style: const TextStyle(
                color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
