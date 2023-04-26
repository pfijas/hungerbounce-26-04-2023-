import 'dart:convert';

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restuarant/Splash/cart.dart';

import '../model/breakfast_model.dart';

class breakfast extends StatefulWidget {
  const breakfast({Key? key}) : super(key: key);

  @override
  State<breakfast> createState() => _breakfastState();
}

class _breakfastState extends State<breakfast> implements passHistory {
  void initState() {
    super.initState();
    breakfastCall;
    breakfastCall.firebaseCall(databaseReference);
    list.length;
  }

  Breakfast? currentProcessingHistory = null;

  int quantity = 0;

  final databaseReference = FirebaseDatabase.instance.ref();
  final breakfastCall = new BreakfastGet();
  bool isLoading = false;
  List<Breakfast> list = [];

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCw4BHQXdoGWsVsaA79pdlKE5pZnE_POD0",
            authDomain: "shoes-kart.firebaseapp.com",
            databaseURL: "https://shoes-kart-default-rtdb.firebaseio.com",
            projectId: "shoes-kart",
            storageBucket: "shoes-kart.appspot.com",
            messagingSenderId: "302761832124",
            appId: "1:302761832124:web:60d95efbc7505e7b3f2ab9",
            measurementId: "G-MPL06W02VL"));
    FutureBuilder futureBuilder = FutureBuilder(
      future: breakfastCall.firebaseCall(databaseReference),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print(snapshot.connectionState);
        if (snapshot.connectionState == ConnectionState.done) {
          if (!snapshot.hasData || snapshot.data.length == 0) {
            return Center(
              child: Text("no data"),
            );
          } else {
            list.clear();
            list.addAll(snapshot.data);
            return ListA();
          }
        } else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    );

    return Scaffold(
      body: isLoading ? ListA() : futureBuilder,
    );
  }

  @override
  void addCard(Breakfast breakfast1) {
    isLoading = true;
    setState(() {
      list.insert(0, breakfast1);
    });
  }

  @override
  void localRefresh() {
    setState(() {
      isLoading = true;
      print(list[0].toString());
    });
  }

  @override
  Breakfast? getCurrentHistory() {
    return currentProcessingHistory;
  }

  dynamic ListA() {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child:InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder( // <-- SEE HERE
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) {
                    return Container(

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children:  <Widget>[
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image(
                              image: NetworkImage('${list.elementAt(index).image}'),
                              //AppImages.magazinePhoto,
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(height: 20,),

                          Center(
                            child: Text('${list.elementAt(index).title}',
                              style: TextStyle(fontSize: 20),),
                          ),

                          SizedBox(height: 20,),

                          Center(child: Text('${list.elementAt(index).description}')),


                        ],
                      ),
                    );
                  });
            },
            child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 4,
            child: Column(
              children: [
                 ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image(
                      image: NetworkImage('${list.elementAt(index).image}'),
                      //AppImages.magazinePhoto,
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),

                ListTile(title: Text(
                    '${list.elementAt(index).title}',
                  style: TextStyle(fontSize: 20),
                  ),
                  trailing: Text('₹${list.elementAt(index).price}'),
                ),
                //Text('₹${list.elementAt(index).price}'),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => cart_1(),
                          ));
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            minimumSize: Size(250, 40)),
                        child: const Text(
                          'Add to cart',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    FavoriteButton(
                      iconSize: 40,
                      isFavorite: false,
                      // iconDisabledColor: Colors.white,
                      valueChanged: (_isFavorite) {
                        print('Is Favorite : $_isFavorite');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          ),
        );
      },
    );
  }



}

class passHistory {
  void addCard(Breakfast breakfast) {}

  void localRefresh() {}

  Breakfast? getCurrentHistory() {}
}
