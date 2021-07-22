import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class Fb extends StatefulWidget {
  const Fb({Key? key}) : super(key: key);

  @override
  _FbState createState() => _FbState();
}

class _FbState extends State<Fb> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => Navigator.pop(context, true),
      child: Container(
        child: Lottie.asset('assets/lottie/facebook.json'),
      ),
    );
  }
}

class Google extends StatefulWidget {
  const Google({Key? key}) : super(key: key);

  @override
  _GoogleState createState() => _GoogleState();
}

class _GoogleState extends State<Google> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => Navigator.pop(context, true),
      child: Container(
        child: Lottie.asset('assets/lottie/google.json'),
      ),
    );
  }
}
