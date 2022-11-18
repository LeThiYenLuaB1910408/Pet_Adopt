import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pet_adopt/const.dart';
import 'package:pet_adopt/models/managers/auth_manager.dart';
import 'package:pet_adopt/models/managers/owner_manager.dart';
import 'package:pet_adopt/pages/login/login_screen.dart';
import 'package:pet_adopt/pages/user/user_manager_screen.dart';
import 'package:provider/provider.dart';
import 'package:pet_adopt/pages/setting/setting_screen.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  Future<void> _refreshOwner(BuildContext context) async {
    await context.read<OwnerManager>().fetchOwners(true);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: blue,
          title: Text(
            "User",
            style: poppins.copyWith(
              //color: black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        body: FutureBuilder(
          future: _refreshOwner(context),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return RefreshIndicator(
              onRefresh: () => _refreshOwner(context),
              child: Consumer<OwnerManager>(
                builder: (context, ownerManager, child) =>
                    SingleChildScrollView(
                  child: Container(
                      height: MediaQuery.of(context).size.height * .84,
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              height: 120,
                              width: 120,
                              // decoration: const BoxDecoration(
                              //   shape: BoxShape.circle,
                              //   color: red,
                              //   image: DecorationImage(
                              //     image: AssetImage('assets/owners/woman-with-cat1.png'),
                              //     fit: BoxFit.cover,
                              //   ),
                              // ),
                              child: CircleAvatar(
                                backgroundColor: blue,
                                child: Text(
                                  ownerManager.owners.first.email[0]
                                      .toUpperCase(),
                                  style: poppins.copyWith(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            ownerManager.owners.first.name,
                            style: poppins.copyWith(
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Text('Informations',
                                  style: poppins.copyWith(
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(
                                    0.0,
                                    0.0,
                                  ),
                                  blurRadius: 10.0,
                                  spreadRadius: -5.0,
                                ), //BoxShadow
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 0.0,
                                  spreadRadius: 0.0,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.phone,
                                      color: blue,
                                      size: 16,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Phone: ',
                                      style: poppins.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          ownerManager.owners.first.phone,
                                          style: poppins.copyWith(
                                            color: black.withOpacity(0.5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.mail,
                                      color: blue,
                                      size: 16,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Email: ',
                                      style: poppins.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          ownerManager.owners.first.email,
                                          style: poppins.copyWith(
                                            color: black.withOpacity(0.5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: blue,
                                      size: 16,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Address: ',
                                      style: poppins.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          // 'Xuan Khanh, Ninh Kieu, Can Tho',
                                          ownerManager.owners.first.address,
                                          style: poppins.copyWith(
                                            color: black.withOpacity(0.5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Text('Options',
                                  style: poppins.copyWith(
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(
                                    0.0,
                                    0.0,
                                  ),
                                  blurRadius: 10.0,
                                  spreadRadius: -5.0,
                                ), //BoxShadow
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 0.0,
                                  spreadRadius: 0.0,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.edit,
                                      size: 16,
                                      color: blue,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Edit profile',
                                      style: poppins.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                    Container(
                                        padding: const EdgeInsets.all(3),
                                        child: const Icon(
                                          Icons.keyboard_arrow_right_rounded,
                                          size: 14,
                                          color: blue,
                                        ))
                                  ],
                                ),
                                Divider(),
                                SizedBox(height: 10),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              UserManagerScreen(),
                                        ));
                                  },
                                  child: Row(
                                    children: [
                                      const Icon(
                                        LineIcons.paw,
                                        size: 22,
                                        color: blue,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'My Pets',
                                        style: poppins.copyWith(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Spacer(),
                                      Container(
                                          padding: const EdgeInsets.all(3),
                                          child: const Icon(
                                            Icons.keyboard_arrow_right_rounded,
                                            size: 14,
                                            color: blue,
                                          ))
                                    ],
                                  ),
                                ),
                                Divider(),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.send,
                                      size: 16,
                                      color: blue,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Send comments',
                                      style: poppins.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                    Container(
                                        padding: const EdgeInsets.all(3),
                                        child: const Icon(
                                          Icons.keyboard_arrow_right_rounded,
                                          size: 14,
                                          color: blue,
                                        ))
                                  ],
                                ),
                                Divider(),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(
                                    0.0,
                                    0.0,
                                  ),
                                  blurRadius: 1.0,
                                  spreadRadius: -1.0,
                                ), //BoxShadow
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 0.0,
                                  spreadRadius: 0.0,
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: Container(
                                color: Colors.grey.shade300,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    context.read<AuthManager>().logout();
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen()),
                                        (route) => false);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.arrowRightFromBracket,
                                        size: 16,
                                        color: black,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Log out',
                                        style: poppins.copyWith(
                                            fontSize: 16,
                                            color: black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
