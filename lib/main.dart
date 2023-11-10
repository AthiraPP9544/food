import 'package:dress_app/screen/cart_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dress_app/screen/signup.dart';
import 'package:provider/provider.dart';


// void main(){
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         body: Container(
//           color: Color.fromARGB(255, 88, 68, 238),
//           alignment: Alignment.center,
//          child:LoginPage(
//          ),
//         ),
//       ),
//     ),
    
//   );
// }
void main(){
  runApp(const MyApp());

}

class MyApp extends StatelessWidget{
  const MyApp({Key?key}):super(key: key);
  @override
  Widget build(BuildContext context){
   
    return ChangeNotifierProvider(create: (_)=>CartProvider(),
    child: Builder(builder: (BuildContext context){
      return MaterialApp(
 title: 'FLUTTER DEMO',
       debugShowCheckedModeBanner: false,
       theme: ThemeData(),
      home: LoginPage(),
      );
    }),
    );
  }
}