import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_adopt/const.dart';
import 'package:pet_adopt/models/managers/pets_manager.dart';
import 'package:pet_adopt/pages/home_screen.dart';
import 'package:pet_adopt/pages/home/home.dart';
import 'package:pet_adopt/pages/signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hiddenPassword = true, errorLogin = false;
  String username = '', password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: white,
        padding: const EdgeInsets.only(
          top: 15.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform.rotate(
                    angle: -4,
                    child: SvgPicture.asset(
                      'assets/Paw_Print.svg',
                      color: orange.shade400,
                      height: 150,
                      width: 150,
                    )),
                Transform.rotate(
                    angle: 4,
                    child: SvgPicture.asset(
                      'assets/Paw_Print.svg',
                      color: orange.shade400,
                      height: 150,
                      width: 150,
                    )),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.only(
                top: 30.0,
                left: 10,
                right: 10,
                bottom: 30.0,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(50),
                  bottom: Radius.circular(50),
                ),
                color: orange.shade200,
              ),
              child: Column(
                children: [
                  Text.rich(
                    TextSpan(
                      style: poppins.copyWith(
                        color: blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        decoration: TextDecoration.none,
                      ),
                      text: "PET ADOPT",
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    // alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            style: poppins.copyWith(
                              color: blue,
                              fontSize: 16,
                              decoration: TextDecoration.none,
                            ),
                            text: "Username:",
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.center,
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                username = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: "Type your username",
                              hintStyle: TextStyle(
                                color: Color(0xF00).withOpacity(0.5),
                              ),
                              border: const UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xF00).withOpacity(0.7),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text.rich(
                          TextSpan(
                            style: poppins.copyWith(
                              color: blue,
                              fontSize: 16,
                              decoration: TextDecoration.none,
                            ),
                            text: "Password:",
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.center,
                          child: TextField(
                            obscureText: hiddenPassword,
                            enableSuggestions: false,
                            autocorrect: false,
                            onChanged: (value) {
                              setState(() {
                                password = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: "Type your Password",
                              hintStyle: TextStyle(
                                color: const Color(0xF00).withOpacity(0.5),
                              ),
                              border: const UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xF00).withOpacity(0.7),
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color: this.hiddenPassword ? null : green,
                                ),
                                onPressed: () {
                                  setState(() {
                                    this.hiddenPassword = !this.hiddenPassword;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        errorLogin
                            ? Text(
                                "Username or password incorrect",
                                style: poppins.copyWith(
                                  color: red,
                                ),
                              )
                            : Container(),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text.rich(
                              TextSpan(
                                style: poppins.copyWith(
                                  color: blue,
                                  fontSize: 16,
                                  decoration: TextDecoration.none,
                                ),
                                text: "Forget Password?",
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (username != '' && password != '') {
                        if (ownersManager.auth(username, password) != null) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                              (route) => false);
                        } else {
                          setState(() {
                            errorLogin = true;
                          });
                        }
                      } else {
                        setState(() {
                          errorLogin = true;
                        });
                      }
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                          color: blue,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 3),
                                color: blue,
                                spreadRadius: 0,
                                blurRadius: 5)
                          ]),
                      child: Center(
                        child: Text(
                          "Login",
                          style: poppins.copyWith(color: white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text.rich(
                    TextSpan(
                        style: poppins.copyWith(
                          color: blue,
                          fontSize: 16,
                          decoration: TextDecoration.none,
                        ),
                        children: [
                          TextSpan(
                              text: "Don't have account?   ", style: poppins),
                          TextSpan(
                              text: "Create new account\n",
                              style: poppins.copyWith(color: green),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpScreen()),
                                      (route) => false);
                                }),
                          TextSpan(
                              text: "Or",
                              style: poppins.copyWith(
                                fontSize: 20,
                              )),
                        ]),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/Icon_Google.svg',
                          height: 150,
                          width: 150,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/Icon_Facebook.svg',
                          // color:
                          height: 150,
                          width: 150,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Transform.rotate(
                      angle: -5,
                      child: SvgPicture.asset(
                        'assets/Paw_Print.svg',
                        color: orange.shade400,
                        height: 150,
                        width: 150,
                      )),
                ),
                Container(
                  child: Transform.rotate(
                      angle: 5,
                      child: SvgPicture.asset(
                        'assets/Paw_Print.svg',
                        color: orange.shade400,
                        height: 150,
                        width: 150,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
