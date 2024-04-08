import 'package:fashion_social_media/screens.dart/home.dart';
import 'package:fashion_social_media/screens.dart/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
          iconTheme: IconThemeData(color: Colors.black, ),
          title: Text('Sign In', style: TextStyle(fontWeight: FontWeight.bold , color: Color.fromARGB(255, 0, 72, 35)),),
        ),
        body: SignInForm(),
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  // Controllers for text fields
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

 signInWithEmailPassword(BuildContext context, String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    Navigator.push(context,MaterialPageRoute(builder: (context) {
              return HomeScreen();
             }));
    print('User ${userCredential.user!.uid} signed in successfully!');
    // Optionally, you can return the UserCredential for further processing
    return userCredential;
  } catch (e) {
    print('Failed to sign in: $e');
    // Show alert dialog if the password is wrong
   
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Incorrect Password'),
            content: Text('The password you entered is incorrect. Please try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
    // Handle other errors appropriately
    
  
}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Center(child: Text('Sign in your account', )),
           SizedBox(height: 30,),
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
           CupertinoButton(
            onPressed: () {
              signInWithEmailPassword(context, _emailController.text.trim(), _passwordController.text.trim());
             
            },
            child: Container( height: 50, width: 550,
              decoration: BoxDecoration(color: Color.fromARGB(255, 0, 6, 47),
              borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text('Sign In', style: TextStyle(color: Colors.white),))),
          ),
           SizedBox(height: 20,),
          Center(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don\'t have an account ?', ),
              SizedBox(width: 5,),
                   GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return SignUpPage();
                      }));
                    },
                    child: Text('Sing Up', style: TextStyle(color: Color.fromARGB(255, 0, 72, 35)),)),
            ],
          )),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
