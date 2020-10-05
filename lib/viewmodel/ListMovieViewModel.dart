import 'package:flutter/foundation.dart';
import 'package:startwarsmovies/web_services/response/MoviesResponse.dart';
import 'package:startwarsmovies/web_services/response/SubPeopleResponse.dart';

class ListMovieViewModel extends ChangeNotifier {
  List<Movie> _ListMovies = List<Movie>();
  bool _pageLoading = false;
  String _stringAllCharactersOfMovie = "";
  List<SubPeopleResponse> _listOfCharacters=List<SubPeopleResponse>();


  List<Movie> get ListMovies => _ListMovies;
  set ListMovies(List<Movie> value) {
    _ListMovies = value;
    notifyListeners();
  }

  bool get pageLoading => _pageLoading;
  set pageLoading(bool value) {
    _pageLoading = value;
    notifyListeners();
  }

  String get stringAllCharactersOfMovie => _stringAllCharactersOfMovie;
  set stringAllCharactersOfMovie(String value) {
    _stringAllCharactersOfMovie = value;
  }

  List<SubPeopleResponse> get listOfCharacters => _listOfCharacters;
  set listOfCharacters(List<SubPeopleResponse> value) {
    _listOfCharacters = value;
  }

  ListMovieViewModel();

}
