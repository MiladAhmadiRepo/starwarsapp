import 'package:flutter/foundation.dart';
import 'package:startwarsmovies/web_services/response/MoviesResponse.dart';
import 'package:startwarsmovies/web_services/response/PeopleResponse.dart';
import 'package:startwarsmovies/web_services/response/SubMovieResponse.dart';

class ListPeopleViewModel extends ChangeNotifier {
  List<People> _ListPeople=List<People> ();
  String _nextUrl="",_stringAllMoviesOfCharacter="";
  bool _pageLoading=false;
  List<SubMovieResponse> _listOfMovies=List<SubMovieResponse>();


  List<SubMovieResponse> get listOfMovies => _listOfMovies;
  set listOfMovies(List<SubMovieResponse> value) {
    _listOfMovies = value;
    notifyListeners();
  }

  get stringAllMoviesOfCharacter => _stringAllMoviesOfCharacter;
  set stringAllMoviesOfCharacter(value) {
    _stringAllMoviesOfCharacter = value;
    notifyListeners();
  }

  List<People> get ListPeople => _ListPeople;
  set ListPeople(List<People> value) {
    _ListPeople = value;
    notifyListeners();
  }

  bool get pageLoading => _pageLoading;
  set pageLoading(bool value) {
    _pageLoading = value;
    notifyListeners();
  }

  String get nextUrl => _nextUrl;
  set nextUrl(String value) {
    _nextUrl = value;
  }


  ListPeopleViewModel();
}