
import 'package:dress_app/screen/product_list.dart';
import 'package:dress_app/screen/signin.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _countryController = TextEditingController();

  void _validate() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();
    String address = _addressController.text.trim();
    String email = _emailController.text.trim();
    String country = _countryController.text.trim();

    if (username.isEmpty || password.isEmpty || address.isEmpty || country.isEmpty) {
      // Show a snackbar or toast to inform the user that fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
    content: Text(
      'Please fill in all the fields.',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: Colors.red, // Background color
    behavior: SnackBarBehavior.floating, // Change the behavior if needed
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0), // Border radius
    ),
    
  ),
      );
    } else if (!EmailValidator.validate(email)) {
      // Show a snackbar or toast to inform the user that the email is not valid
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
    content: Text(
      'Please fill valid email',
      style: TextStyle(
        color: Colors.white, // Text color
        fontSize: 16, // Font size
        fontWeight: FontWeight.bold, // Font weight
      ),
    ),
    backgroundColor: Colors.red, // Background color
    behavior: SnackBarBehavior.floating, // Change the behavior if needed
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0), // Border radius
    ),
    
  ),
      );
    } else {
      
      
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductListScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: 950,
          width: 700,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/food.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 220.0),
                child: Text(
                  'FOODEEE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, right: 210),
                child: Text(
                  'SIGN UP.......',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 242, 243, 245),
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Enter User name',
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    textAlignVertical: TextAlignVertical.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 242, 243, 245),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Enter your phone number/password',
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 242, 243, 245),
                  child: TextField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.home),
                      hintText: 'Enter your address',
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    textAlignVertical: TextAlignVertical.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 242, 243, 245),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      hintText: 'Enter your email id',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    textAlignVertical: TextAlignVertical.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 242, 243, 245),
                  child: TextField(
                    controller: _countryController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_city),
                      hintText: 'Enter your country',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    textAlignVertical: TextAlignVertical.center,
                  ),
                ),
              ),
              GestureDetector(
                onTap: _validate,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20, top: 25),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    color: const Color.fromARGB(255, 238, 235, 239),
                    child: Center(
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 12, 1, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 100),
                child: Text(
                  'All READY HAVE AN ACCOUNT ?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    letterSpacing: 2,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SigninPage(),
                    ),
                  );
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 300.0, bottom: 150),
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
