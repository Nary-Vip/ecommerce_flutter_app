import 'package:basics/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:basics/widgets/drawer.dart';
import 'package:flutter/services.dart';
import "dart:convert";

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
    final catJson = await rootBundle.loadString("assets/files/catalogue.json");
    final decodedCatJson = jsonDecode(catJson);
    var products = decodedCatJson["products"];
    CatalogModel.products =
        List.from(products).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
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
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
        child: (CatalogModel.products.isNotEmpty)
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 15),
                itemCount: CatalogModel.products.length,
                itemBuilder: (context, index) {
                  final items = CatalogModel.products[index];
                  return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: GridTile(
                        header: Container(
                          child: Text(
                            items.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                          padding: const EdgeInsets.all(12.0),
                          decoration:
                              const BoxDecoration(color: Colors.deepPurple),
                        ),
                        child: Image.network(items.imgUrl, fit: BoxFit.contain),
                        footer: Container(
                          child: Text(
                            items.price.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          padding: const EdgeInsets.all(12.0),
                          decoration: const BoxDecoration(color: Colors.black),
                        ),
                      ));
                })
            // ? ListView.builder(
            //     itemCount: CatalogModel.products.length,
            //     itemBuilder: (context, index) {
            //       return ItemWidget(item: CatalogModel.products[index]);
            //     },
            //   )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
