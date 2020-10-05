import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:startwarsmovies/presenter/ListOfMoviePresenter.dart';
import 'package:startwarsmovies/presenter/ListOfPeoplePresenter.dart';
import 'package:startwarsmovies/views/ListOfMovieViewComponent.dart';
import 'package:startwarsmovies/views/ListOfPeopleViewComponent.dart';
import 'constatnts/ConstantClass.dart';
import 'constatnts/appTheme.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget _MovieTab;
  Widget _AboutPage;
  Widget _CharacterTab;
  int _currentIndex;
  Widget _currentPage;
  List<Widget> _pages;
  BasicListOfMoviePresenter basicListOfMoviePresenter;
  BasicListOfPeoplePresenter basicListOfPeoplePresenter;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    basicListOfMoviePresenter = BasicListOfMoviePresenter();
    basicListOfPeoplePresenter = BasicListOfPeoplePresenter();
    _MovieTab = ListOfMovieViewComponent(basicListOfMoviePresenter);
    _CharacterTab = ListOfPeopleViewComponent(basicListOfPeoplePresenter);
    _AboutPage = AboutPage();
    _pages = [_MovieTab, _CharacterTab, _AboutPage];
    _currentIndex = 0;
    _currentPage = _MovieTab;
  }

  void changeTab(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = _pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    globalContext = context;
    return Scaffold(
      appBar: AppBar(
          elevation: 5,
          backgroundColor: AppTheme.white,
          title: Row(
            children: [
              Text(
                'StarWars',
                style: AppTheme.AppbarBlack,
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: AppTheme.black,
                ),
                onPressed: () {},
              )
            ],
          )),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: AppTheme.blackLight, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    label: '',
                    icon: movieIconSvg,
                    activeIcon: movieSelectedIconSvg,
                  ),
                  BottomNavigationBarItem(
                    label: '',
                    icon: characterIconSvg,
                    activeIcon: characterSelectedIconSvg,
                  ),
                  BottomNavigationBarItem(
                    label: '',
                    icon: aboutIconSvg,
                    activeIcon: aboutSelectedIconSvg,
                  ),
                ],
                currentIndex: _currentIndex,
                onTap: (int index) {
                  changeTab(index);
                }),
          )),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => basicListOfPeoplePresenter.getListOfPeopleViewModel()),
          ChangeNotifierProvider(create: (context) => basicListOfMoviePresenter.getListOfMovieViewModel()),
        ],
        child: Container(
          width: fullWidth,
          height: fullHeight,
          child: _currentPage,
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Text("Star Wars App"),
              ],
            ),
          ),
          // Loading form
        ],
      ),
    );
  }
}

