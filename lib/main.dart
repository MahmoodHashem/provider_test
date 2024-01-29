
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/models/provider.dart';

import 'favorites.dart';

const int listLength = 15;
void main(){
  runApp(ChangeNotifierProvider(
    create: (context) => FavoriteProvider(),
    child: MaterialApp(
      home: MyApp()
    ),
  ));
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Demo"),
      ),

      body: ListView.separated(
          itemBuilder: (context, index){
            return ListTile(
              title: Text(index.toString()),
              trailing: IconButton(
                  onPressed: (){
                    Provider.of<FavoriteProvider>(context, listen: false).toggleFavorite(index);

              }, icon:Provider.of<FavoriteProvider>(context).isExist(index) ? Icon(Icons.favorite, color: Colors.red) : Icon(Icons.favorite_border),
              ),
            );
          },
          separatorBuilder: (context, index){
            return SizedBox(height: 10,);
          },
          itemCount: 20),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (c) => Favorites()));
      }, label: Text("Favorites")),
    );
  }
}










// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Provider Demo')
//       ),
//       body: Consumer<FavoriteProvider>(
//         builder: (context, favorite, child){
//           return ListView.separated(
//               itemBuilder: (context, index){
//
//                 return ListTile(
//                   trailing: IconButton(onPressed: (){
//
//                     favorite.toggleFavorite(index);
//
//                     print('toggled');
//                   }, icon: Icon(favorite.isExist(index) ? Icons.favorite: Icons.favorite_border )),
//                   title: Text(index.toString()),
//                 );
//               },
//               separatorBuilder: (context, index){
//                 return SizedBox(
//                   height: 10,
//                 );
//               },
//               itemCount: listLength);
//         },
//       ),
//       floatingActionButton: FloatingActionButton.large(onPressed: (){
//
//         Navigator.push(context, MaterialPageRoute(builder: (c)=> Favorites()));
//
//       }, child: Text("Favorites")),
//     );
//   }
// }
