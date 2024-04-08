import 'dart:developer';

import 'package:fashion_social_media/screens.dart/home.dart';
import 'package:fashion_social_media/screens.dart/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sign up', style: TextStyle(fontWeight: FontWeight.bold , color: Color.fromARGB(255, 0, 72, 35)),),
        ),
        body: SignUpForm(),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  // Controllers for text fields
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
Future<void> createFirebaseAccount(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    log('Account created successfully with ID: ${userCredential.user!.uid}');
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SignInPage();
    }));
  } catch (e) {
    log('Failed to create account: $e');
    // Handle error appropriately
  }
}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Center(child: Text('Create account and enjoy all services', )),
           SizedBox(height: 30,),
          TextField(
            controller: _fullNameController,
            decoration: InputDecoration(
              labelText: 'Full Name',
              prefixIcon: Icon(Icons.person, color: Color.fromARGB(255, 0, 72, 35),),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email, color: Color.fromARGB(255, 0, 72, 35),),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 0, 72, 35),),
              suffixIcon: IconButton(
                icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _confirmPasswordController,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 0, 72, 35),),
              suffixIcon: IconButton(
                icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          CupertinoButton(
            onPressed: () {createFirebaseAccount(_emailController.text.trim(), _passwordController.text.trim());
            
            },
            child: Container( height: 50, width: 550,
              decoration: BoxDecoration(color: Color.fromARGB(255, 0, 6, 47),
              borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text('Sign Up', style: TextStyle(color: Colors.white),))),
          ),
          SizedBox(height: 20,),
          Center(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account?', ),
              SizedBox(width: 5,),
                   GestureDetector(
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) {
              return SignInPage();
             }));
                    },
                    child: Text('Sing in', style: TextStyle(color: Color.fromARGB(255, 0, 72, 35)),)),
            ],
          )),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
