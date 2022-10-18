import 'package:flutter/material.dart';
import 'package:pet_adopt/const.dart';
import 'package:pet_adopt/pages/setting/setting_screen.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User",
          style: poppins.copyWith(
            // color: black,
            fontSize: 30,
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
      body: SingleChildScrollView(
        child: Container(
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
                        'L',
                        style: poppins.copyWith(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Le Thi Yen Lua",
                  style: poppins.copyWith(
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 20),
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
                                '0384944147',
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
                                'LuaB1910408@student.ctu.edu.vn',
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
                                'Xuan Khanh, Ninh Kieu, Can Tho',
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
              ],
            )),
      ),
    );
  }
}
