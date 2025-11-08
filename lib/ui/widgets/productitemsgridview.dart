import 'package:Nectar/services/models/allproductmodel.dart';
import 'package:Nectar/ui/pages/productdetails.dart';
import 'package:flutter/material.dart';

class ProductItemsGridview extends StatelessWidget {
  final List<Allproductmodel> productmodel;
  final VoidCallback?callback;
  // final VoidCallback?callbackforbox;
  const ProductItemsGridview({super.key, this.callback, required this.productmodel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 250, child: GridView.builder(itemCount: productmodel.length,padding: EdgeInsets.all(10), scrollDirection: Axis.horizontal, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: 174, mainAxisSpacing: 15, crossAxisCount: 1), itemBuilder: (context, index) => Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xFFE2E2E2)),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(18)
            ),child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.start, children: [
                InkWell(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Productdetails(id: productmodel[index].id,),));
                }, child: Center(child: Image(image: NetworkImage(productmodel[index].image),height: 80,width: 99,))),
                Text(productmodel[index].name,overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                Text(productmodel[index].stockStatus,style: TextStyle(fontSize: 14),),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text(productmodel[index].price,style: TextStyle(fontSize: 18,color: Colors.black),),
                  IconButton(onPressed: callback, icon: Image(image: AssetImage("lib/assets/icons/add_button.png"),height: 45,width: 45,))
                ],)
              ],),
            ),
          ),),);
  }
}