import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/models/provider.dart';


class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: Consumer<FavoriteProvider>(
        builder: (context, favorite, child){
          return  ListView.separated(
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(favorite.indices[index].toString()),
                  trailing: IconButton(
                      onPressed: (){
                        favorite.toggleFavorite(favorite.indices[index]);
                      },
                      icon: favorite.isExist(favorite.indices[index])? Icon(Icons.favorite, color: Colors.red,): Icon(Icons.favorite_border)),
                );
              },
              separatorBuilder:(context, index){
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: favorite.indices.length);
        },
      )
    );
  }
}



















//
// class Favorites extends StatelessWidget {
//   const Favorites({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Text('Favorites')
//       ),
//       body: Consumer<FavoriteProvider>(
//         builder: (context, favorite, child){
//           return ListView.separated(
//               itemBuilder: (context, index){
//                 return ListTile(
//                   trailing: IconButton(onPressed: (){
//
//                     favorite.toggleFavorite(favorite.indecis[index]);
//
//                   }, icon: Icon(favorite.isExist(favorite.indecis[index]) ? Icons.favorite: Icons.favorite_border)),
//                   title: Text(favorite.indecis[index].toString()),
//                 );
//               },
//               separatorBuilder: (context, index){
//                 return SizedBox(
//                   height: 10,
//                 );
//               },
//               itemCount: favorite.indecis.length);
//         },
//       ),
//     );
//   }
// }
