import 'package:flutter/material.dart';
import 'package:mybasicapp/screens/homepage.dart';

import 'forgot password.dart';
import 'signup.dart';
 // Import your menu screen

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _login() {
    // Basic validation
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      // Show error if fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter  valid email and password'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Simulate login process (replace with actual authentication logic)
    if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login Successful'),
          backgroundColor: Colors.green,
        ),
      );

      // Navigate to Menu screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homepage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(_obscurePassword
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              obscureText: _obscurePassword,
            ),
            SizedBox(height: 16),
            ElevatedButton(

              onPressed: _login,
              child: Text('Login',style: TextStyle(backgroundColor: Colors.blue,color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotPasswordScreen())
                );
              },
              child: Text('Forgot Password?'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen())
                );
              },
              child: Text('Create an Account'),
            ),
          ],
        ),
      ),
    );
  }
}