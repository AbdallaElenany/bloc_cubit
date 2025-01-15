import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 54,
            ),
            Image.asset(
              "assets/images/1.PNG",
              height: 180,
            ),
            const SizedBox(
              height: 26,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 165,
                  top: -40,
                  //generator circle//===============
                  child: Container(
                    width: 190,
                    height: 190,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff4fccf9),
                          Color(0xff69bfde),
                          Color(0xff8dbacb)
                        ],
                      ),
                    ),
                  ),
                  //generator circle//===============
                  /*Image.asset(
                    "assets/images/2.PNG",
                  ),*/
                ),
                Positioned(
                  left: 20,
                  top: -20,
                  child: Image.asset(
                    "assets/images/2.PNG",
                    height: 70,
                  ),
                ),
                Positioned(
                  left: -35,
                  top: 335,
                  child: Image.asset(
                    "assets/images/2.PNG",
                    height: 150,
                  ),
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        width: 300,
                        /* decoration: ShapeDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(0.85, -0.76),
                            end: Alignment(-0.85, 0.76),
                            colors: [Color(0x66E7E7E7), Color(0x4C8DC9CD)],
                          ),
                          shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(width: 1, color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),*/
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: 'Full Name',
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: 'E-mail or Mobile Number',
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                              ),
                            ),
                            const SizedBox(height: 22.0),
                            Text.rich(
                              style: const TextStyle(
                                color: Color(0xFF757575),
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "By Signing up, You’re agree to our ",
                                  ),
                                  TextSpan(
                                    style: const TextStyle(
                                      color: Color(0xFF14DDEF),
                                    ),
                                    text: " Terms & Conditions ",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {},
                                  ),
                                  const TextSpan(
                                    text: " and ",
                                  ),
                                  TextSpan(
                                    style: const TextStyle(
                                      color: Color(0xFF14DDEF),
                                    ),
                                    text: " Privacy Policy",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {},
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Center(
                              child: Container(
                                width: 227,
                                height: 37,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF4CB6BD),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: const Text(
                                      'Continue',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Joined Us Before ?',
                                  style: TextStyle(
                                    color: Color(0xFF757575),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: Color(0xFF4CB6BD),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
