import 'package:startwarsmovies/viewmodel/ListMovieViewModel.dart';
import 'package:startwarsmovies/views/ListOfMovieView.dart';
import 'package:startwarsmovies/web_services/WebServiceRepository.dart';
import 'package:startwarsmovies/web_services/response/MoviesResponse.dart';

abstract class ListOfMoviePresenter {
  set listOfMovieView(ListOfMovieView value){}
  void setListOfMovieViewModel(ListMovieViewModel value){}
  ListMovieViewModel getListOfMovieViewModel(){}
  void onMovieClicked(List<String> listOfCharacter,int index) {}
  int getListSize(){}
  Movie getMovieItem(int index){}
  void firstLoad(){}
}

class BasicListOfMoviePresenter implements ListOfMoviePresenter{
  //view model
  ListMovieViewModel _listOfMovieViewModel;
  //view
  ListOfMovieView _listOfMovieView;
  WebServiceRepository _webServiceRepository;

  //contractor of presenter
  BasicListOfMoviePresenter() {
    _webServiceRepository??=WebServiceRepository();
    this._listOfMovieViewModel = ListMovieViewModel();
    firstLoad();
  }

  @override
  ListMovieViewModel getListOfMovieViewModel() {
    return _listOfMovieViewModel;
  }

  @override
  void setListOfMovieViewModel(ListMovieViewModel value) {
    _listOfMovieViewModel=value;
  }

  @override
  set listOfMovieView(ListOfMovieView value) {
    _listOfMovieView = value;
  }

  //get list of all start war movies
  @override
  void firstLoad() async{
    _listOfMovieViewModel.pageLoading=true;
    _webServiceRepository.getMoviesList(nextUrl: "").then((data) {
      _listOfMovieViewModel.ListMovies=data.listMovies;
      _listOfMovieViewModel.pageLoading=false;
    });
  }

  //tap on a movie to show all characters in that movie
  @override
  void onMovieClicked(List<String> listOfCharacter,int index) {
    _listOfMovieViewModel.pageLoading=true;
    _listOfMovieViewModel.listOfCharacters.clear();
    _listOfMovieViewModel.stringAllCharactersOfMovie="";
    listOfCharacter.forEach((element) {
      _webServiceRepository.getCharactersInMovie( element).then((data) {
        _listOfMovieViewModel.listOfCharacters.add(data);
        if (_listOfMovieViewModel.listOfCharacters.length == listOfCharacter.length)
        {
          _listOfMovieViewModel.listOfCharacters.forEach((element) {
            _listOfMovieViewModel.stringAllCharactersOfMovie+=element.name+"  ,  ";
          });
          _listOfMovieViewModel.pageLoading=false;
          _listOfMovieView.createBottomSheet(_listOfMovieViewModel, index);
        }
      });
    });
  }

  //get size of movie list
  @override
  int getListSize() {
    return _listOfMovieViewModel.ListMovies.length;
  }

  //get a item of movie list
  @override
  Movie getMovieItem(int index) {
    return _listOfMovieViewModel.ListMovies[index];
  }





}