import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:provider/provider.dart';
import 'package:startwarsmovies/constatnts/ConstantClass.dart';
import 'package:startwarsmovies/constatnts/appTheme.dart';
import 'package:startwarsmovies/presenter/ListOfPeoplePresenter.dart';
import 'package:startwarsmovies/viewmodel/ListMovieViewModel.dart';
import 'package:startwarsmovies/viewmodel/ListPeopleViewModel.dart';
import 'package:startwarsmovies/web_services/response/PeopleResponse.dart';

import 'ListOfPeopleView.dart';

class ListOfPeopleViewComponent extends StatefulWidget {
  final String title;
  final ListOfPeoplePresenter listOfPeoplePresenter;

  ListOfPeopleViewComponent(this.listOfPeoplePresenter, {Key key, this.title}) : super(key: key);

  @override
  _ListOfPeopleViewComponentState createState() => _ListOfPeopleViewComponentState();
}

class _ListOfPeopleViewComponentState extends State<ListOfPeopleViewComponent> implements ListOfPeopleView {
  BuildContext context;
  int count = 0;
  int top = 10;
  Widget loadImage;
  List<Widget> imagesList = [
    imageList4Image,
    imageList5Image,
    imageList6Image,
  ];

  @override
  void initState() {
    super.initState();
    widget.listOfPeoplePresenter.listOfPeopleView = this;
  }

  @override
  Widget build(BuildContext context) {
    globalContext = context;
    return Center(
      child: Consumer<ListPeopleViewModel>(
        builder: (context, listPeopleViewModel, child) {
          return Stack(children: [
            EasyRefresh.custom(
              header: BezierCircleHeader(backgroundColor: AppTheme.white, color: AppTheme.amberLight),
              footer: BezierBounceFooter(backgroundColor: AppTheme.white, color: AppTheme.amberLight),
              onRefresh: () async {
                await Future.delayed(Duration(seconds: 2), () {});
              },
              onLoad: () async {
                widget.listOfPeoplePresenter.allCharactersInMovies();
              },
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      loadImage = imagesList[index%3];
                      return (listPeopleViewModel.ListPeople.length > 0)
                          ? PeopleListItem(
                              item: listPeopleViewModel,
                              index: index,
                              loadImage: loadImage,
                              listOfPeoplePresenter: widget.listOfPeoplePresenter,
                            )
                          : Container();
                    },
                    childCount: listPeopleViewModel.ListPeople.length,
                  ),
                ),
              ],
            ),
            Positioned(
              child: listPeopleViewModel.pageLoading
                  ? Container(
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(AppTheme.amberLight),
                        ),
                      ),
                      color: Colors.white.withOpacity(0.8),
                    )
                  : Container(),
            ),
          ]);
        },
      ),
    );
  }

  @override
  void showLoadMoreInList() {
    // TODO: implement showLoadMoreInList
  }

  @override
  void showLoading() {
    // TODO: implement showLoading
  }

  @override
  void navigateToPeoplePage(List<String> peopleUrls) {
    Navigator.pushNamedAndRemoveUntil(
      globalContext,
      "/PeoplePage",
      (Route<dynamic> route) => false,
      arguments: {"peopleUrls": peopleUrls},
    );
  }

  @override
  void createBottomSheet(listPeopleViewModel, int index) async {
    showBottomSheet(
      context: globalContext,
      builder: (context) {
        return Container(
          height: fullHeight / 2,
          child: new Container(
            decoration: new BoxDecoration(
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(20.0), topRight: const Radius.circular(20.0))),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(width: width15Percent, child: loadImage),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Name: " + listPeopleViewModel.ListPeople[index].name,
                          style: AppTheme.lightBlackBig,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "BirthYear: " + listPeopleViewModel.ListPeople[index].birthYear,
                          style: AppTheme.lightBlackBig,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Gender: " + listPeopleViewModel.ListPeople[index].gender,
                          style: AppTheme.lightBlackBig,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Mass: " + listPeopleViewModel.ListPeople[index].mass,
                          style: AppTheme.lightBlackBig,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Text(
                        "Height: " + listPeopleViewModel.ListPeople[index].height,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTheme.lightGrey14Style,
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Flexible(
                      child: Text(
                        "EyeColor: " + listPeopleViewModel.ListPeople[index].eyeColor,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTheme.lightGrey14Style,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Text(
                        "HairColor: " + listPeopleViewModel.ListPeople[index].hairColor,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTheme.lightGrey14Style,
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Flexible(
                      child: Text(
                        "SkinColor: " + listPeopleViewModel.ListPeople[index].skinColor,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTheme.lightGrey14Style,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Text(
                        "Movies: " + listPeopleViewModel.stringAllMoviesOfCharacter,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: AppTheme.lightGrey14Style,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      backgroundColor: AppTheme.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        side: BorderSide(
          width: 1,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class PeopleListItem extends StatefulWidget {
  ListPeopleViewModel item;
  int index;
  Widget loadImage;
  ListOfPeoplePresenter listOfPeoplePresenter;

  PeopleListItem({this.item, this.index, this.loadImage, this.listOfPeoplePresenter});

  @override
  _PeopleListItemState createState() => _PeopleListItemState();
}

class _PeopleListItemState extends State<PeopleListItem> {
  String moviesName = "";

  @override
  Widget build(BuildContext context) {
    return Consumer<ListPeopleViewModel>(builder: (context, listPeopleViewModel, child) {
      return Container(
        color: AppTheme.spacer,
        width: fullWidth,
        height: heightPercent,
        child: GestureDetector(
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Flexible(
                flex: 20,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(),
                    ),
                    Flexible(
                      flex: 16,
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            margin: EdgeInsets.only(top: 30),
                            decoration: new BoxDecoration(
                                color: Colors.white, borderRadius: new BorderRadius.all(Radius.circular(12))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: width20Percent + width6Percent,
                                    ),
                                    Text(
                                      widget.item.ListPeople[widget.index].name,
                                      style: AppTheme.lightBlack,
                                    ),
                                    Spacer(),
                                    Container(
                                        margin: EdgeInsets.only(right: 5),
                                        child: Text(
                                          "8.8",
                                          style: AppTheme.rankAmbit,
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: width20Percent + width6Percent,
                                    ),
                                    Flexible(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 8),
                                        child: Text(
                                          "Gender: " + widget.item.ListPeople[widget.index].gender,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: AppTheme.lightGreyStyle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: width20Percent + width6Percent,
                                    ),
                                    Flexible(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 8),
                                        child: Text(
                                          "mass: " + widget.item.ListPeople[widget.index].mass,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: AppTheme.lightGreyStyle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                              width: width20Percent,
                              margin: EdgeInsets.only(bottom: 20, left: width4Percent),
                              child: ClipRRect(
                                child: widget.loadImage,
                                borderRadius: BorderRadius.circular(8.0),
                              )),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
          onTap: () {
            print(listPeopleViewModel.stringAllMoviesOfCharacter);
            widget.listOfPeoplePresenter.onPeopleClicked(widget.item.ListPeople[widget.index].films,widget.index);
            // _createBottomSheet(listPeopleViewModel, moviesName);
          },
        ),
      );
    });
  }
}
