import 'package:Nectar/services/apiservices/apirequest/getsingleproduct.dart';
import 'package:Nectar/ui/widgets/rectangleroundedbutton.dart';
import 'package:flutter/material.dart';

class Productdetails extends StatefulWidget {
  final int id;
  const Productdetails({super.key, required this.id});

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFF2F3F2),
        automaticallyImplyLeading: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
      ),
      body: FutureBuilder(
        future: Getsingleproduct().getsingleproduct(widget.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          if (snapshot.data!['status'] == false)
            return Center(child: Text("Product Error"));
          return Column(
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
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(15),
                        child: Image(
                          image:
                              snapshot.data!['image'] ==
                                  "https://api.zhndev.site/wp-content/uploads/woocommerce-placeholder-300x300.webp"
                              ? AssetImage(
                                  "lib/assets/productimages/pngtree-colorful-mixed-fruit-smoothie-with-straw-png-image_20069721.png",
                                )
                              : NetworkImage(snapshot.data!['image']),
                          height: 200,
                          width: 330,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 40,
                  ),
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
                              snapshot.data!['name'],
                              style: TextStyle(fontSize: 24),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite_border),
                            ),
                          ],
                        ),
                        Text(
                          snapshot.data!['stockstatus'],
                          style: TextStyle(fontSize: 16),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.remove),
                                ),
                                Text("1", style: TextStyle(fontSize: 18)),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add),
                                ),
                              ],
                            ),
                            Text(
                              snapshot.data!['price'] == ""
                                  ? "1.0"
                                  : snapshot.data!["price"],
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
                            Text(
                              "Product Details",
                              style: TextStyle(fontSize: 16),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.keyboard_arrow_down_sharp),
                            ),
                          ],
                        ),
                        Text(
                          snapshot.data!['description'],
                          style: TextStyle(fontSize: 13),
                        ),
                        Container(height: 1, color: Colors.grey.shade300),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Nutritions", style: TextStyle(fontSize: 16)),
                            Row(
                              children: [
                                Text(snapshot.data!['type']),
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
          );
        },
      ),
    );
  }
}
