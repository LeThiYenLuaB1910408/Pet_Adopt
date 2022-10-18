import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_adopt/const.dart';
import 'package:pet_adopt/pages/login/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool hiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            height: 900,
            color: white,
            padding: EdgeInsets.only(
              top: 0,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Transform.rotate(
                          angle: -4,
                          child: SvgPicture.asset(
                            'assets/Paw_Print.svg',
                            color: orange.shade400,
                            height: 150,
                            width: 150,
                          )),
                    ),
                    Container(
                      child: Transform.rotate(
                          angle: 4,
                          child: SvgPicture.asset(
                            'assets/Paw_Print.svg',
                            color: orange.shade400,
                            height: 150,
                            width: 150,
                          )),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 20.0,
                    left: 10,
                    right: 10,
                    bottom: 20.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
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
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: MediaQuery.of(context).size.width,
                        // alignment: Alignment.topLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
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
                              alignment: Alignment.center,
                              child: TextField(
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
                              alignment: Alignment.center,
                              child: TextField(
                                obscureText: this.hiddenPassword,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  hintText: "Type your Password",
                                  hintStyle: TextStyle(
                                    color: Color(0xF00).withOpacity(0.5),
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
                              height: 20,
                            ),
                            Text.rich(
                              TextSpan(
                                style: poppins.copyWith(
                                  color: blue,
                                  fontSize: 16,
                                  decoration: TextDecoration.none,
                                ),
                                text: "Comfirm Password:",
                              ),
                              textAlign: TextAlign.start,
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: TextField(
                                obscureText: this.hiddenPassword,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  hintText: "Type your Comfirm Password",
                                  hintStyle: TextStyle(
                                    color: Color(0xF00).withOpacity(0.5),
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
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                              (route) => false);
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
                              "SIGN UP",
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
                                  text:
                                      "By Signing up you argee to our Terms Conditions & privacy policies\n",
                                  style: poppins),
                              // TextSpan(
                              //     text: "Create new account\n",
                              //     style: poppins.copyWith(color: green)),
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
        ),
      ),
    );
  }
}
