import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_adopt/const.dart';
import 'package:pet_adopt/models/managers/pets_manager.dart';
import 'package:pet_adopt/pages/home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:pet_adopt/pages/login/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool hiddenPassword = true,
      errorSignup = false,
      hiddenConfirmPassword = true,
      errorConfirm = false;
  String username = '', password = '', confirmPassword = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(children: [
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.95,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              color: orange.shade200,
                              width: MediaQuery.of(context).size.width - 40,
                              height: MediaQuery.of(context).size.height,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: -30,
                                    right: -50,
                                    height: 180,
                                    width: 180,
                                    child: Transform.rotate(
                                      angle: 4,
                                      child: SvgPicture.asset(
                                        "assets/Paw_Print.svg",
                                        color: orange.shade400,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 230,
                                    left: -50,
                                    height: 180,
                                    width: 180,
                                    child: Transform.rotate(
                                      angle: -5,
                                      child: SvgPicture.asset(
                                        "assets/Paw_Print.svg",
                                        color: orange.shade400,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: -30,
                                    right: -50,
                                    height: 180,
                                    width: 180,
                                    child: Transform.rotate(
                                      angle: 5.3,
                                      child: SvgPicture.asset(
                                        "assets/Paw_Print.svg",
                                        color: orange.shade400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .9,
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      left: 10,
                      right: 10,
                      bottom: 10.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(50),
                        bottom: Radius.circular(50),
                      ),
                      color: Colors.transparent,
                    ),
                    child: Column(
                      children: [
                        Text.rich(
                          TextSpan(
                            style: poppins.copyWith(
                              color: black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
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
                                    color: black,
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
                                    color: black,
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
                                      color:
                                          const Color(0xF00).withOpacity(0.5),
                                    ),
                                    border: const UnderlineInputBorder(),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xF00).withOpacity(0.7),
                                      ),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: this.hiddenPassword
                                          ? FaIcon(
                                              FontAwesomeIcons.solidEye,
                                              size: 16,
                                            )
                                          : FaIcon(
                                              FontAwesomeIcons.solidEyeSlash,
                                              size: 16,
                                            ),
                                      onPressed: () {
                                        setState(() {
                                          this.hiddenPassword =
                                              !this.hiddenPassword;
                                        });
                                      },
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
                                    color: black,
                                    fontSize: 16,
                                    decoration: TextDecoration.none,
                                  ),
                                  text: "Comfirm Password:",
                                ),
                                textAlign: TextAlign.start,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                alignment: Alignment.center,
                                child: TextField(
                                  obscureText: hiddenConfirmPassword,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  onChanged: (value) {
                                    setState(() {
                                      confirmPassword = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Type your Comfirm Password",
                                    hintStyle: TextStyle(
                                      color:
                                          const Color(0xF00).withOpacity(0.5),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: errorConfirm
                                            ? Color(0xF00).withOpacity(0.7)
                                            : red,
                                      ),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: errorConfirm
                                            ? red
                                            : Color(0xF00).withOpacity(0.7),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xF00).withOpacity(0.5),
                                      ),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: this.hiddenConfirmPassword
                                          ? FaIcon(
                                              FontAwesomeIcons.solidEye,
                                              size: 16,
                                            )
                                          : FaIcon(
                                              FontAwesomeIcons.solidEyeSlash,
                                              size: 16,
                                            ),
                                      onPressed: () {
                                        setState(() {
                                          this.hiddenConfirmPassword =
                                              !this.hiddenConfirmPassword;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              errorSignup
                                  ? Text(
                                      "Username already exists",
                                      style: poppins.copyWith(
                                        color: red,
                                      ),
                                    )
                                  : Container(),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      style: poppins.copyWith(
                                        color: blue,
                                        fontWeight: FontWeight.bold,
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
                            if (password != confirmPassword) {
                              setState(() {
                                errorConfirm = true;
                              });
                            } else {
                              if (password == '' || confirmPassword == '') {
                                setState(() {
                                  errorConfirm = true;
                                });
                              } else {
                                setState(() {
                                  errorConfirm = false;
                                });
                                if (ownersManager.addOwner(
                                    username, password)) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()),
                                      (route) => false);
                                } else {
                                  setState(() {
                                    errorSignup = true;
                                  });
                                }
                              }
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
                                "Sign Up",
                                style: poppins.copyWith(
                                    color: white, fontSize: 16),
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
                                color: black,
                                fontSize: 16,
                                decoration: TextDecoration.none,
                              ),
                              children: [
                                TextSpan(
                                    text:
                                        "By Signing up you argee to our Terms Conditions & privacy policies\n",
                                    style: poppins.copyWith(
                                      color: blue,
                                    ),
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
                            IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/Icon_Apple.svg',
                                // color:
                                height: 150,
                                width: 150,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
