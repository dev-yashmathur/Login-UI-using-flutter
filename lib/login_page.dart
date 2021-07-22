import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'lottie_anims.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  String email = "";
  String pwd = "";
  bool pwdValid = false;
  var emailValid = false;
  String _appBarText = "Sign in";
  var changeOption = "Don't have an account?";
  var buttonText = "Sign Up";
  var signIn = false;
  Color logInColor = Colors.blue;
  var facebookColor = Colors.cyan[300];
  var googleColor = Colors.cyan[300];

  double paddingForEntry(double w) {
    if (w > 500) {
      return 0.3 * w;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colors.cyan[300],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _appBarText,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 32.0,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.cyan],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.only(top: 0.1 * _height),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: paddingForEntry(_width)),
                    child: Container(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: TextField(
                        onChanged: (val) {
                          setState(() {
                            if (val.length > 5 &&
                                val.contains('@') &&
                                val.contains('.') &&
                                !val.endsWith('.')) {
                              emailValid = true;
                            } else {
                              emailValid = false;
                            }
                          });
                        },
                        style: const TextStyle(fontSize: 24.0),
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          suffixIcon: emailValid
                              ? const Icon(Icons.check, color: Colors.cyan)
                              : const Icon(Icons.cancel, color: Colors.red),
                          prefixIcon: const Icon(Icons.email),
                          hintText: 'Enter Email',
                          hintStyle: const TextStyle(fontSize: 20.0),
                          fillColor: Colors.cyan[100],
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: paddingForEntry(_width)),
                    child: TextField(
                      onChanged: (val) {
                        setState(() {
                          pwdValid = val.length > 7 ? true : false;
                        });
                      },
                      style: const TextStyle(fontSize: 24.0),
                      controller: _pwdController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: pwdValid
                            ? const Icon(Icons.check, color: Colors.cyan)
                            : const Icon(Icons.cancel, color: Colors.red),
                        hintText: 'Enter Password',
                        hintStyle: const TextStyle(fontSize: 20.0),
                        fillColor: Colors.cyan[100],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 16.0, color: Colors.black),
                    children: [
                      TextSpan(text: changeOption),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _appBarText = signIn ? "Sign In" : "Sign Up";
                      buttonText = !signIn ? "Sign In" : "Sign Up";
                      changeOption = !signIn
                          ? "Already Have an account?"
                          : "Dont have an account?";
                      signIn = !signIn;
                    });
                  },
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: AnimatedContainer(
                duration: const Duration(seconds: 2),
                decoration: BoxDecoration(
                  color: logInColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.transparent,
                    animationDuration: const Duration(seconds: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      logInColor = Colors.indigo;
                      email = _emailController.text;
                      pwd = _pwdController.text;
                    });
                  },
                  child: const Text(
                    "Log In",
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 0.05 * _height, bottom: 0.05 * _height),
              child: const Text(
                "---or---",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const Text(
              "Sign in with these options:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Padding(
              //fb and google icons
              padding: EdgeInsets.only(top: 0.01 * _height),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context, builder: (_) => const Fb());
                      },
                      child: Image.asset(
                        "assets/images/facebook.png",
                        width: 48,
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 3,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(20),
                        primary: facebookColor, // <-- Button color
                        //onPrimary: Colors.red, // <-- Splash color
                      ),
                    ),
                  ),
                  Padding(
                    //google button
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context, builder: (_) => const Google());
                      },
                      child: Image.asset(
                        "assets/images/google.png",
                        width: 48,
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 3,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(20),
                        primary: googleColor, // <-- Button color
                        //onPrimary: Colors.red, // <-- Splash color
                      ),
                    ),
                  ),
                ], //row children
              ),
            ),
          ], //column childern
        ),
      ),
    );
  }
}
