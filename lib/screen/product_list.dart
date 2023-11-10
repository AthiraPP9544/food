import 'package:badges/src/badge.dart' as badge;
import 'package:dress_app/screen/cart_model.dart';
import 'package:dress_app/screen/cart_provider.dart';
import 'package:dress_app/screen/cart_screen.dart';
import 'package:dress_app/screen/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  
  List<String> productName = ['PUTT','SADYA','TEA','BIRIYANI', 'POROTTA', 'NOODLES','COCKTAIL'];
  List<String> productUnit = ['NO', 'NO', 'NO','FULL','NO','NO','NO'];
  List<int> productPrice = [50, 80, 25,120,80,60,80];
  List<String> productImage = [
    'assets/images/putt.jpg',
    'assets/images/sadya.jpg',
    'assets/images/tea.jpg',
    'assets/images/biriyani.jpg',
    'assets/images/porotta.jpg',
    'assets/images/noodle.jpg',
    
    'assets/images/cocktail.jpg'
  ];

  DBHelper? dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 91, 3, 3),
        title: Text(
          'PRODUCT LIST',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
         InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
            },
            child: Center(
              child: badge.Badge(
                badgeContent: Consumer<CartProvider>(
                  builder: (context,value,child){
                    return Text(value.getCounter().toString(),style: TextStyle(color: Colors.white),
                  
                );},
                  
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child:
               ListView.builder(
            itemCount: productName.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.center,

                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image(
                            height: 120,
                            width: 160,
                            image: AssetImage(productImage[index].toString(),
                            ),

                          ),
                          Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40.0, top: 10),
                                  child: Text(
                                    productName[index].toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 45.0),
                                  child: Text(
                                    productUnit[index].toString() +
                                        " " +
                                        "Rs" +
                                        productPrice[index].toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 55.0),
                                  child: InkWell(
                                    onTap: (){
                                   dbHelper!.insert(
                                      Cart(id: index, 
                                      productId: index.toString(), 
                                      productName: productName[index].toString(), 
                                      initialPrice: productPrice[index],  
                                      productPrice: productPrice[index],
                                      quantity: 1,
                                      unitTag: productUnit[index].toString(), 
                                       image: productImage[index].toString())
                                   ).then((value){
                                    print('Product added to thee cart');
                                    cart.addTotalPrice(double.parse(productPrice[index].toString()));
                                     cart.addCounter();
                                   }).onError((error, stackTrace){
                                    print(error.toString());
                                   });
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 100,
                                      decoration:
                                          BoxDecoration(color: Color.fromARGB(255, 96, 4, 10)),
                                      child: Center(
                                        child: Text(
                                          'ADD TO CART',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          ),
         
        ],
      ),
    );
  }
}

