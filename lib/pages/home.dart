import 'package:basics/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:basics/widgets/drawer.dart';
import 'package:flutter/services.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var catJson = await rootBundle.loadString("assets/files/catalogue.json");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "NaryKart",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: CatalogModel.products.length,
          itemBuilder: (context, index) {
            return ItemWidget(item: CatalogModel.products[index]);
          },
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
