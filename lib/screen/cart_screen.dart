import 'package:badges/src/badge.dart' as badge;
import 'package:dress_app/screen/cart_model.dart';
import 'package:dress_app/screen/cart_provider.dart';
import 'package:dress_app/screen/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget{
  const CartScreen({Key?key}):super(key: key);
  @override
  _CartSState createState()=> _CartSState();
}

class _CartSState extends State<CartScreen>{

DBHelper?dbHelper=DBHelper();

  @override
  Widget build(BuildContext context){
    final cart=Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 91, 3, 3),
        title: Text(
          'MY CART',
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
      body:Column(
        children: [
          FutureBuilder(
            future: cart.getData(),
            builder: (context,AsyncSnapshot<List<Cart>> snapshot){
              if(snapshot.hasData){
                     return Expanded(
                      child: ListView.builder(
                        
            itemCount: snapshot.data!.length,
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
                            image: AssetImage(snapshot.data![index].image.toString()
                            ),

                          ),
                          Expanded(
                            child: Column(
                                children: [
                                  // Padding(
                                  //   padding: const EdgeInsets.only(
                                  //       left: 40.0, top: 10),
                                  //   child: Text(
                                  //     snapshot.data![index].productName.toString(),
                                         
                                  //     style: TextStyle(
                                  //         fontSize: 20,
                                  //         fontWeight: FontWeight.bold),
                                  //   ),
                                  // ),
                                  Row(children: [
                                   
                                  Padding(
                                    padding: const EdgeInsets.only(left:180.0),
                                    child: InkWell(
                                      onTap: (){
                                        dbHelper!.delete(snapshot.data![index].id!);
                                        cart.removerCounter();
                                        cart.removerTotalPrice(double.parse(snapshot.data![index].productPrice.toString(),));
                                      },
                                      child: Icon(
                                                      Icons.delete,
                                                                ),
                                    ),
                                  )],),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: Text(
                                      snapshot.data![index].unitTag.toString() +
                                          " " +
                                          "Rs" +
                                          snapshot.data![index].productPrice.toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                          
                                  Padding(
                                    padding: const EdgeInsets.only(left: 55.0),
                                    child: InkWell(
                                      onTap: (){
                           
                                    
                                      },
                                      child: Container(
                                        height: 35,
                                        width: 100,
                                        decoration:
                                            BoxDecoration(color: Color.fromARGB(255, 96, 4, 10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: (){
                                                   int quantity =snapshot.data![index].quantity!;
                                                  int price=snapshot.data![index].initialPrice!;
                                                  quantity--;
                                                  int?newPrice= price*quantity;
                                                   if(quantity>0){
                                                     dbHelper!.updateQuantity(
                                                    Cart(id: snapshot.data![index].id!,
                                                    
                                                     productId: snapshot.data![index].id!.toString(),
                                                      productName: snapshot.data![index].productName.toString(),
                                                       initialPrice:snapshot.data![index].initialPrice!,
                                                        productPrice: newPrice,
                                                         quantity: quantity,
                                                          unitTag: snapshot.data![index].unitTag.toString(), 
                                                          image: snapshot.data![index].image.toString())
                                                  ).then((value){
                                                   newPrice=0;
                                                   quantity=0;
                                                   cart.removeTotalPrice(double.parse(snapshot.data![index].initialPrice!.toString()));
                                                  }).onError((error, stackTrace){
                                                    print(error.toString());
                                                  });
                                                   }
                                                 
                                                },
                                                child: Icon(
                                                            Icons.remove,
                                                           color: Colors.white,
                                                           
                                                          ),
                                              ),
                                               Text(
                                                 snapshot.data![index].quantity.toString(),
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                              InkWell(
                                                onTap: (){
                                                  int quantity =snapshot.data![index].quantity!;
                                                  int price=snapshot.data![index].initialPrice!;
                                                  quantity++;
                                                  int?newPrice= price*quantity;

                                                  dbHelper!.updateQuantity(
                                                    Cart(id: snapshot.data![index].id!,
                                                    
                                                     productId: snapshot.data![index].id!.toString(),
                                                      productName: snapshot.data![index].productName.toString(),
                                                       initialPrice:snapshot.data![index].initialPrice!,
                                                        productPrice: newPrice,
                                                         quantity: quantity,
                                                          unitTag: snapshot.data![index].unitTag.toString(), 
                                                          image: snapshot.data![index].image.toString())
                                                  ).then((value){
                                                   newPrice=0;
                                                   quantity=0;
                                                   cart.addTotalPrice(double.parse(snapshot.data![index].initialPrice!.toString()));
                                                  }).onError((error, stackTrace){
                                                    print(error.toString());
                                                  });
                                                },
                                                child: Icon(
                                                            Icons.add,
                                                             color: Colors.white,
                                                          ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
                      );
                     
              }
              return Text('');

          }),
           Consumer <CartProvider>(builder: (context,value,child){
                return Visibility(
                  visible: value.getTotalPrice().toStringAsFixed(2) == '0.00' ? false : true,
                  child: Column(
                    children: [
                        ReusableWidget(title: 'Total', value: 'Rs '+value.getTotalPrice().toStringAsFixed(2))
                    ],
                  ),
                );
              })
        ],
      ) ,
    );
  }
}


class ReusableWidget extends StatelessWidget{
  final String title,value;
  const ReusableWidget({required this.title,required this.value});
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(title,style: Theme.of(context).textTheme.subtitle2),
         Text(value.toString(),style: Theme.of(context).textTheme.subtitle2)
      ],),
    );
  }
}
