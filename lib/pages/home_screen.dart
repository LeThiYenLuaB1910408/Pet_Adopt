import 'package:flutter/material.dart';
import 'package:pet_adopt/pages/chat/chat_screen.dart';
import 'package:pet_adopt/pages/favorite_screen.dart';
import 'package:pet_adopt/pages/home/home.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_adopt/const.dart';
import 'package:pet_adopt/pages/user/user_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPage = 0;
  List<IconData> icons = [
    Icons.home_outlined,
    Icons.favorite_outline_rounded,
    Icons.chat_outlined,
    Icons.person_outline_rounded
  ];
  List pages = [
    HomePage(),
    FavoritePage(),
    ChatPage(),
    UserPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedPage],
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Container bottomNavigationBar() {
    return Container(
      height: 50,
      color: white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            icons.length,
            (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedPage = index;
                    });
                  },
                  child: Container(
                    height: 60,
                    width: 50,
                    padding: const EdgeInsets.all(5),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 60,
                          width: 50,
                          child: Column(
                            children: [
                              Icon(
                                icons[index],
                                color: selectedPage == index
                                    ? blue
                                    : black.withOpacity(0.6),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              selectedPage == index
                                  ? Container(
                                      height: 5,
                                      width: 5,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle, color: blue),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                        index == 2
                            ? Positioned(
                                right: 0,
                                top: -5,
                                child: Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle, color: blue),
                                    child: Text(
                                      '6',
                                      style: poppins.copyWith(color: white),
                                    )),
                              )
                            : Container()
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
