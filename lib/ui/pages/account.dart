import 'package:Nectar/logic/auth/providerdata.dart';
import 'package:Nectar/logic/providers/profiledetailsprovider.dart';
import 'package:Nectar/ui/pages/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  void initState() {
    super.initState();
    Provider.of<Profiledetailsprovider>(listen: false, context).getprofileDetails();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 40),
          child: Row( children: [
            ClipRRect(borderRadius: BorderRadius.circular(50), child: Image(image: AssetImage("lib/assets/icons/profile.png"),height: 64,width: 64,)),
            SizedBox(width: 10,),
            Consumer<Profiledetailsprovider>(builder: (_, proviver, _){
              return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Text(proviver.displayname,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                IconButton(onPressed: (){}, icon: Icon(Icons.edit_outlined),color: Color(0xFF53B175),)
              ],),
              Text(proviver.email,style: TextStyle(fontSize: 16),)
            ],);
            },)
          ],),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(children: [
          SizedBox(height: 10,),
          Container(height: 1, color: Colors.grey.shade300,),
          ListTile(onTap: () {
            
          }, leading: Icon(Icons.shopping_bag), title: Text("Orders",style: TextStyle(fontSize: 18),),trailing: Icon(Icons.arrow_right,size: 35,),),
          Container(height: 1, color: Colors.grey.shade300,),
          ListTile(onTap: () {
            
          },leading: Icon(Icons.card_membership_outlined), title: Text("My Details",style: TextStyle(fontSize: 18),),trailing: Icon(Icons.arrow_right,size: 35,),),
          Container(height: 1, color: Colors.grey.shade300,),
          ListTile(onTap: () {
            
          },leading: Icon(Icons.location_on), title: Text("Delivery Address",style: TextStyle(fontSize: 18),),trailing: Icon(Icons.arrow_right,size: 35,),),
          Container(height: 1, color: Colors.grey.shade300,),
          ListTile(onTap: () {
            
          },leading: Icon(Icons.credit_card), title: Text("Payment Methods",style: TextStyle(fontSize: 18),),trailing: Icon(Icons.arrow_right,size: 35,),),
          Container(height: 1, color: Colors.grey.shade300,),
          ListTile(onTap: () {
            
          },leading: Icon(Icons.card_giftcard_rounded), title: Text("Promo Code",style: TextStyle(fontSize: 18),),trailing: Icon(Icons.arrow_right,size: 35,),),
          Container(height: 1, color: Colors.grey.shade300,),
          ListTile(onTap: () {
            
          },leading: Icon(Icons.notifications_active), title: Text("Notifications",style: TextStyle(fontSize: 18),),trailing: Icon(Icons.arrow_right,size: 35,),),
          Container(height: 1, color: Colors.grey.shade300,),
          ListTile(onTap: () {
            
          },leading: Icon(Icons.help), title: Text("Help",style: TextStyle(fontSize: 18),),trailing: Icon(Icons.arrow_right,size: 35,),),
          Container(height: 1, color: Colors.grey.shade300,),
          ListTile(onTap: () {
            
          },leading: Icon(Icons.details_rounded), title: Text("About ",style: TextStyle(fontSize: 18),),trailing: Icon(Icons.arrow_right,size: 35,),),
          Container(height: 1, color: Colors.grey.shade300,),
          ListTile(onTap: () {
            String message = '';
            Provider.of<Providerdata>(listen: false, context).tokenremove();
            Provider.of<Providerdata>(listen: false, context).registrationcheck(message);
            Provider.of<Providerdata>(listen: false, context).logincheck(message);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Loginpage(),));
          },leading: Icon(Icons.exit_to_app), title: Text("Sign Out ",style: TextStyle(fontSize: 18),),trailing: Icon(Icons.arrow_right,size: 35,),),
          ],),
        )
      
      ],),
    );
  }
}