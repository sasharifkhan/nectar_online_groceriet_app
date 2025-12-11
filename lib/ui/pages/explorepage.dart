import 'dart:math';

import 'package:Nectar/services/models/categoriesmodel.dart';
import 'package:Nectar/services/providers/categoriesprovider.dart';
import 'package:Nectar/ui/pages/categoriesproduct.dart';
import 'package:Nectar/ui/widgets/searchbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Explorepage extends StatefulWidget {
  const Explorepage({super.key});

  @override
  State<Explorepage> createState() => _ExplorepageState();
}

class _ExplorepageState extends State<Explorepage> {
  @override
  void initState() {
    super.initState();
    Provider.of<Categoriesprovider>(listen: false, context).categories();
  }

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final colors = [
      Color.fromARGB(82, 238, 192, 239),
      Color.fromARGB(255, 189, 222, 239),
      Color.fromARGB(255, 182, 244, 209),
      Color.fromARGB(255, 148, 202, 243),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            children: [
              Text(
                "Find Products",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Searchbox(),
              Expanded(
                child: Consumer<Categoriesprovider>(
                  builder: (ctx, provider, _) {
                    List<Categoriesmodel> productcategories =
                        provider.productcategories;
                    if (provider.isloading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (productcategories.isEmpty) {
                      return Center(child: Text("Categories is Empty"));
                    }
                    return GridView.builder(
                      itemCount:
                          8, // Item count//////////////////////////////////////////
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        mainAxisExtent: 190,
                      ),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Categoriesproduct(),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: colors[random.nextInt(colors.length)],
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: Color(0x53B175B2),
                              width: 2,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Item Images////////////////////////////////////////////////
                              productcategories[index].image == null
                                  ? CircularProgressIndicator()
                                  : Image(
                                      image: NetworkImage(
                                        '${productcategories[index].image}',
                                      ),
                                      height: 111,
                                      width: 111,
                                    ),
                              Text(
                                // Item name////////////////////////////////////////////////////
                                productcategories[index].name == "Beverages"
                                    ? "Bags"
                                    : productcategories[index].name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
