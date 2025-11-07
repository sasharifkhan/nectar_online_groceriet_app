import 'package:Nectar/logic/providers/locationprovider.dart';
import 'package:Nectar/services/models/allproductmodel.dart';
import 'package:Nectar/services/providers/productsprovider.dart';
import 'package:Nectar/ui/pages/productdetails.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:Nectar/ui/widgets/grocerieslist.dart';
import 'package:Nectar/ui/widgets/productitemsgridview.dart';
import 'package:Nectar/ui/widgets/searchbox.dart';
import 'package:provider/provider.dart';

class Shopscreen extends StatefulWidget {
  const Shopscreen({super.key});

  @override
  State<Shopscreen> createState() => _ShopscreenState();
}

class _ShopscreenState extends State<Shopscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<Productsprovider>(listen: false, context).getallproduct();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            children: [
              Image(
                image: AssetImage("lib/assets/icons/nectar_icon_red.png"),
                height: 30,
                width: 26,
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("lib/assets/icons/location_icon.png"),
                    height: 18,
                    width: 15,
                  ),
                  SizedBox(width: 10),
                  Consumer<Locationprovider>(
                    builder: (ctx, provider, _) {
                      provider.setlicationfromgetstorate();
                      String location = provider.locationdetails;
                      return Text(location);
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              const Searchbox(),
              SizedBox(height: 1),
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 115,
                      width: double.infinity,
                      child: CarouselSlider(
                        items: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusGeometry.circular(18),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(18),
                              child: Image(
                                image: AssetImage(
                                  "lib/assets/images/banner.png",
                                ),
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ),
                        ],
                        options: CarouselOptions(
                          autoPlay: true,
                          height: 130,
                          viewportFraction: 1,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Exclusive Offer",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF53B175),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Consumer<Productsprovider>(builder: (_, provider, _) {
                      List<Allproductmodel>allproducts = provider.allproducts;
                      return ProductItemsGridview(
                      callbackforbox: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Productdetails(),
                        ),
                      ),
                      itemCount: 5,
                      productname: allproducts[1].name,
                      productdescription: allproducts[0].stockStatus,
                      productprice: allproducts[1].price,
                      productimage: AssetImage(
                        "lib/assets/productimages/banana.png",
                      ),
                    );
                    },),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Best Selling",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF53B175),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    ProductItemsGridview(
                      callbackforbox: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Productdetails(),
                        ),
                      ),
                      itemCount: 5,
                      productname: "Organic Bananas",
                      productdescription: '7pcs, Price',
                      productprice: "#4.99",
                      productimage: AssetImage(
                        "lib/assets/productimages/banana.png",
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Groceries",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF53B175),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Grocerieslist(),
                    SizedBox(height: 10),
                    ProductItemsGridview(
                      callbackforbox: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Productdetails(),
                        ),
                      ),
                      itemCount: 5,
                      productname: "Organic Bananas",
                      productdescription: '7pcs, Price',
                      productprice: "#4.99",
                      productimage: AssetImage(
                        "lib/assets/productimages/banana.png",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
