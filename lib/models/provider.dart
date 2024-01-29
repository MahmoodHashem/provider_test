


import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {

  List<int> _indices = [];


  List<int> get indices => _indices;

  late bool isFav;

  bool isExist(int index){
    isFav = _indices.contains(index);
    return isFav;
  }

  void toggleFavorite(int index){

    if(isExist(index)){
      _indices.remove(index);
    }else{
      _indices.add(index);
    }
    notifyListeners();
  }






}














// List<int> _indecis = [];
//
// List<int> get indecis => _indecis;
//
// late bool isFav;
//
// bool isExist (int index){
//  isFav = _indecis.contains(index);
//   return isFav;
// }
//
// void toggleFavorite(int index){
//   if(isExist(index)){
//     _indecis.remove(index);
//   }else{
//     _indecis.add(index);
//   }
//   notifyListeners();
// }


//}