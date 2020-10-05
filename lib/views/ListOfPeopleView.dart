import 'package:startwarsmovies/viewmodel/ListPeopleViewModel.dart';

import '../viewmodel/ListMovieViewModel.dart';
abstract class ListOfPeopleView {
  void showLoading(){}
  void showLoadMoreInList(){}
  void createBottomSheet(ListPeopleViewModel listPeopleViewModel, int index){}
}