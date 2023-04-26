import 'package:firebase_database/firebase_database.dart';

class Breakfast{
  //model class
  final String? title;
  final String? description;
  final String? image;
  final int? price;
//constructor
  Breakfast({
    this.image,
    this.price,
    this.title,
    this.description,
});
//model class to map
  factory Breakfast.fromMap(Map<dynamic,dynamic>map){
    return Breakfast(
      image: map['image'],
      price: map['price'],
      description: map['description'],
      title: map['title']
    );
  }
}

class BreakfastGet{
  //calling the datas from firebase
  Future<List<Breakfast>>firebaseCall(DatabaseReference databaseReference)async{
    List<Breakfast>list=[];
    DatabaseEvent event=await databaseReference.child("fooditems").once();
    for(var element in event.snapshot.children){
      Map<dynamic,dynamic>jsonresponse=element.value as  Map<dynamic,dynamic>;
      Breakfast breakfast=Breakfast.fromMap(jsonresponse);

      list.insert(0, breakfast);
      print(jsonresponse.toString());

    }

return list;
  }

}