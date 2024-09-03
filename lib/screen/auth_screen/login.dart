import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/controller/auth_controller.dart';
import 'package:store_app/screen/auth_screen/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController authController = AuthController();
  late String email;
  late String password;
  bool isLoading = false;

  loginUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      await authController
          .signInUser(context: context, email: email, password: password)
          .whenComplete(() {
        setState(() {
          isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login Your Account",
                    style: GoogleFonts.getFont("Lato",
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        letterSpacing: 0.2),
                  ),
                  Text(
                    "To Explore the world exclusives",
                    style: GoogleFonts.getFont("Lato",
                        color: Colors.white, fontSize: 14, letterSpacing: 0.2),
                  ),
                  Image.asset(
                    "/images/Illustration.png",
                    width: 200,
                    height: 200,
                  ),
                  // Align(
                  //   alignment: Alignment.topLeft,
                  //   child: Text(
                  //     "Email Address",
                  //     style: GoogleFonts.getFont("Lato",
                  //         color: Colors.white,
                  //         fontWeight: FontWeight.w500,
                  //         letterSpacing: 0.2),
                  //   ),
                  // ),
                  TextFormField(
                    onChanged: (value) => email = value,
                    validator: (value) =>
                        value!.isEmpty ? "Please Enter Your Email" : null,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        labelText: "Enter your Email",
                        labelStyle: GoogleFonts.getFont("Lato"),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "/icons/email.png",
                            width: 20,
                            height: 20,
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) => password = value,
                    validator: (value) =>
                        value!.isEmpty ? "Please Enter Your Password" : null,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        labelText: "Enter your Password",
                        labelStyle: GoogleFonts.getFont("Lato"),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "/icons/password.png",
                            width: 20,
                            height: 20,
                          ),
                        ),
                        suffixIcon: const Icon(Icons.visibility)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      await loginUser();
                    },
                    child: Container(
                      width: 319,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: const LinearGradient(
                              colors: [Colors.deepPurple, Colors.purple])),
                      child: Center(
                          child: isLoading
                              ? const CircularProgressIndicator()
                              : Text(
                                  "Sign in",
                                  style: GoogleFonts.getFont("Lato",
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Need an account ?",
                        style: GoogleFonts.getFont("Lato", letterSpacing: 1),
                      ),
                      const SizedBox(width: 4),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const RegisterScreen();
                          }));
                        },
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.getFont("Lato",
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
