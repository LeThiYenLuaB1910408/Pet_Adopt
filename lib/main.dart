import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pet_adopt/models/managers/owner_manager.dart';
import 'package:pet_adopt/models/managers/pets_manager.dart';
import 'package:pet_adopt/models/managers/auth_manager.dart';
import 'package:pet_adopt/pages/home_screen.dart';
import 'package:pet_adopt/pages/login/login_screen.dart';
import 'package:pet_adopt/pages/onboard/onboard_screen.dart';
import 'package:pet_adopt/pages/splash_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await dotenv.load();
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
          create: (ctx) => AuthManager(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => OwnerManager(),
        ),
        ChangeNotifierProxyProvider<AuthManager, PetsManager>(
          create: (ctx) => PetsManager(),
          update: (ctx, authManager, petsManager) {
            petsManager!.authToken = authManager.authToken;
            return petsManager;
          },
        ),
        ChangeNotifierProvider(
          create: (ctx) => PetsManager(),
        ),
        // ChangeNotifierProvider(
        //   create: (ctx) => CartManager(),
        // ),
        // ChangeNotifierProvider(
        //   create: (ctx) => OrdersManager(),
        // ),
        // ),
      ],
      child: Consumer<AuthManager>(
        builder: (ctx, authManager, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Pet Adopt',
            theme: ThemeData(
              primarySwatch: Colors.blueGrey,
            ),
            home: const OnBoardPage()),
      ),
    );
  }
}
