import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:restuarant/splash/HomePage.dart';
import 'package:restuarant/splash/loginpage.dart';
import 'package:restuarant/splash/signup.dart';
import 'package:restuarant/splash/splash_1.dart';
import 'Splash/Editprofilepage.dart';
import 'Splash/Profilepage.dart';
import 'Splash/Settingpage.dart';
import 'Splash/Tables.dart';
import 'Splash/breakfastpage.dart';
import 'Splash/afternoon.dart';
import 'Splash/cart.dart';
import 'Splash/foodcard.dart';
import 'Splash/foodsection.dart';
import 'Splash/settings_2.dart';

main()async {
  runApp(Myapp());
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  await Firebase.initializeApp(options: FirebaseOptions(
      apiKey: "AIzaSyCw4BHQXdoGWsVsaA79pdlKE5pZnE_POD0",
      authDomain: "shoes-kart.firebaseapp.com",
      databaseURL: "https://shoes-kart-default-rtdb.firebaseio.com",
      projectId: "shoes-kart",
      storageBucket: "shoes-kart.appspot.com",
      messagingSenderId: "302761832124",
      appId: "1:302761832124:web:60d95efbc7505e7b3f2ab9",
      measurementId: "G-MPL06W02VL"
  ));

}
final themeMode = ValueNotifier(2);

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home:SplashScreen(),
        );
      },
      valueListenable: themeMode,
    );
  }
}
// class classes extends StatefulWidget {
//   const classes({Key? key}) : super(key: key);

//   @override
//   State<classes> createState() => _classesState();
// }

// class _classesState extends State<classes> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: 200,
//         width: 100,
//         child: CustomCard(title: "ghgjh",description: "rttyryty",
//         price: "2334",image: "https://img.freepik.com/premium-photo/appam-velliappam-kallappam-paalappam-tasty-delicious-breakfast-item-south-india-with-good-combination-kadala-curry-bengal-gram-curry-placed-white-background_527904-2533.jpg?w=996"),
//       ),
//     );
//   }
// }
