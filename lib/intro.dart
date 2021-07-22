import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class IntroText extends StatefulWidget {
  const IntroText({Key? key}) : super(key: key);
  @override
  _IntroTextState createState() => _IntroTextState();
}

class _IntroTextState extends State<IntroText> {
  List<MaterialColor> animBackgroundColor = [
    Colors.cyan,
    Colors.blue,
    Colors.indigo,
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds: 3), () {
    //   setState(() {
    //     index = index == 2 ? 0 : index += 1;
    //   });
    // });
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      },
      child: Scaffold(
        body: AnimatedContainer(
          duration: const Duration(seconds: 2),
          //color: AnimBackgroundColor[index],
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: animBackgroundColor,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          curve: Curves.easeIn,
          // onEnd: () {
          //   print("Set state");
          //   setState(() {
          //     index = index == 2 ? 0 : index += 1;
          //   });
          // },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText(
                      'Login UI',
                      textStyle: const TextStyle(
                        fontSize: 64.0,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: const Duration(milliseconds: 200),
                    ),
                  ],
                  isRepeatingAnimation: true,
                  repeatForever: true,
                  pause: const Duration(seconds: 1),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Tap To Continue',
                        speed: const Duration(milliseconds: 100),
                      )
                    ],
                    isRepeatingAnimation: true,
                    repeatForever: true,
                    pause: const Duration(seconds: 1),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
