import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_adopt/models/managers/pets_manager.dart';
import 'package:pet_adopt/pages/home_screen.dart';
import 'package:pet_adopt/pages/onboard/onboard_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => PetsManager(),
          // ),
          // ChangeNotifierProvider(
          //   create: (ctx) => CartManager(),
          // ),
          // ChangeNotifierProvider(
          //   create: (ctx) => OrdersManager(),
          // ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pet Adopt',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: const OnBoardPage(),
      ),
    );
  }
}
