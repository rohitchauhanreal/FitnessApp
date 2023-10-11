import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_auth/home_page.dart';
import 'package:google_auth/sign_in.dart';
import 'package:google_auth/widgets/form_container.dart';
import 'firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        // Background Image
        Image.asset(
        "assets/images/signBack.jpg",
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign Up",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              FormContainerWidget(
                controller: _usernameController,
                hintText: "Username",
                isPasswordField: false,
              ),
              const SizedBox(
                height: 10,
              ),
              FormContainerWidget(

                controller: _emailController,
                hintText: "Email",
                isPasswordField: false,
              ),
              const SizedBox(
                height: 10,
              ),
              FormContainerWidget(
                controller: _passwordController,

                hintText: "Password",
                isPasswordField: true,
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: _signUp,
                child: Container(
                  width: 200,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              const SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                  const SizedBox(width: 5,),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context, MaterialPageRoute(builder: (context) => const LoginPage()), (route) => false);
                      },
                      child: const Text("Login", style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),))
                ],
              )
            ],
          ),
        ),
      ),
    ]));
  }

  void _signUp() async {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      // Show an error dialog if any field is empty
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Please fill in all fields."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      User? user = await _auth.signUpWithEmailAndPassword(email, password);

      if (user != null) {
        print("User is successfully created");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        print("Some error happened");
      }
    }}}