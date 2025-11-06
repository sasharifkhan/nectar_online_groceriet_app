import 'package:Nectar/ui/widgets/rectangleroundedbutton.dart';
import 'package:flutter/material.dart';

class Productdetails extends StatelessWidget {
  const Productdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFF2F3F2),
        automaticallyImplyLeading: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.only(
                bottomRight: Radius.circular(40),
                bottomLeft: Radius.circular(40),
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Color(0xFFF2F3F2)),
                child: Center(
                  child: Image(
                    image: AssetImage("lib/assets/productimages/apple.png"),
                    height: 200,
                    width: 330,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Naturel Red Apple",
                          style: TextStyle(fontSize: 24),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_border),
                        ),
                      ],
                    ),
                    Text("1kg, Price", style: TextStyle(fontSize: 16)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.remove),
                            ),
                            Text("1",style: TextStyle(fontSize: 18),),
                            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                          ],
                        ),
                        Text(
                          "#4.99",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(height: 1, color: Colors.grey.shade300),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Product Details", style: TextStyle(fontSize: 16)),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.keyboard_arrow_down_sharp),
                        ),
                      ],
                    ),
                    Text(
                      "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.",
                      style: TextStyle(fontSize: 13),
                    ),
                    Container(height: 1, color: Colors.grey.shade300),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Nutritions", style: TextStyle(fontSize: 16)),
                        Row(
                          children: [
                            Text("100gr"),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.keyboard_arrow_right),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(height: 1, color: Colors.grey.shade300),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Review", style: TextStyle(fontSize: 16)),
                        Row(
                          children: [
                            Icon(Icons.star, color: Color(0xFFF3603F)),
                            Icon(Icons.star, color: Color(0xFFF3603F)),
                            Icon(Icons.star, color: Color(0xFFF3603F)),
                            Icon(Icons.star, color: Color(0xFFF3603F)),
                            Icon(Icons.star, color: Color(0xFFF3603F)),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.keyboard_arrow_right),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Rectangleroundedbutton(
                      buttonName: "Add To Basket",
                      buttonbgcolor: Color(0xFF53B175),
                      callback: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}