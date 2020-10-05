import 'package:startwarsmovies/viewmodel/ListPeopleViewModel.dart';
import 'package:startwarsmovies/views/ListOfPeopleView.dart';
import 'package:startwarsmovies/web_services/WebServiceRepository.dart';

abstract class ListOfPeoplePresenter {
  set listOfPeopleView(ListOfPeopleView value) {}

  void setListOfPeopleViewModel(ListPeopleViewModel value) {}

  ListPeopleViewModel getListOfPeopleViewModel() {}

  void onPeopleClicked(List<String> peopleList,int index) {}

  void allCharactersInMovies() {}
}

class BasicListOfPeoplePresenter implements ListOfPeoplePresenter {
  //view model
  ListPeopleViewModel _listOfPeopleViewModel;
  //view
  ListOfPeopleView _listOfPeopleView;
  WebServiceRepository _webServiceRepository;

  //contractor of presenter
  BasicListOfPeoplePresenter() {
    _webServiceRepository ??= WebServiceRepository();
    this._listOfPeopleViewModel = ListPeopleViewModel();
    allCharactersInMovies();
  }

  @override
  ListPeopleViewModel getListOfPeopleViewModel() {
    return _listOfPeopleViewModel;
  }

  @override
  void setListOfPeopleViewModel(ListPeopleViewModel value) {
    _listOfPeopleViewModel = value;
  }

  @override
  set listOfPeopleView(ListOfPeopleView value) {
    _listOfPeopleView = value;
  }

  //get list of all start war characters in all movies
  @override
  void allCharactersInMovies() async {
    _listOfPeopleViewModel.pageLoading = true;
    _webServiceRepository.getPeopleList(nextUrl: _listOfPeopleViewModel.nextUrl.toString()).then((data) {
      _listOfPeopleViewModel.ListPeople .addAll(data.people) ;
      _listOfPeopleViewModel.nextUrl = data.next;
      _listOfPeopleViewModel.pageLoading = false;
    });
  }

  //tap on a character to show all details about the character
  @override
  void onPeopleClicked(List<String> peopleList,int index) {
    _listOfPeopleViewModel.pageLoading=true;
    _listOfPeopleViewModel.listOfMovies.clear();
    _listOfPeopleViewModel.stringAllMoviesOfCharacter="";
    peopleList.forEach((element) {
      _webServiceRepository.getMoviesOfACharacter( element).then((data) {
        _listOfPeopleViewModel.listOfMovies.add(data);
        if (_listOfPeopleViewModel.listOfMovies.length == peopleList.length)
          {
            _listOfPeopleViewModel.listOfMovies.forEach((element) {
              _listOfPeopleViewModel.stringAllMoviesOfCharacter+=element.title+"  ,  ";
            });
            _listOfPeopleViewModel.pageLoading=false;
            _listOfPeopleView.createBottomSheet(_listOfPeopleViewModel, index);
          }
      });
    });
  }




}
