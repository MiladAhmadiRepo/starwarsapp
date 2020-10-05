import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:provider/provider.dart';
import 'package:startwarsmovies/constatnts/ConstantClass.dart';
import 'package:startwarsmovies/constatnts/appTheme.dart';
import 'package:startwarsmovies/viewmodel/ListMovieViewModel.dart';
import 'package:startwarsmovies/web_services/response/MoviesResponse.dart';

import '../presenter/ListOfMoviePresenter.dart';
import '../views/ListOfMovieView.dart';

class ListOfMovieViewComponent extends StatefulWidget {
  final String title;
  final ListOfMoviePresenter listOfMoviePresenter;

  ListOfMovieViewComponent(this.listOfMoviePresenter, {Key key, this.title}) : super(key: key);

  @override
  _ListOfMovieViewComponentState createState() => _ListOfMovieViewComponentState();
}

class _ListOfMovieViewComponentState extends State<ListOfMovieViewComponent> implements ListOfMovieView {
  BuildContext context;
  int count = 0;
  int top = 10;
  List<Widget> imagesList = [
    imageList1Image,
    imageList2Image,
    imageList3Image,
  ];
  Widget imageMovie;

  @override
  void initState() {
    super.initState();
    widget.listOfMoviePresenter.listOfMovieView = this;
  }

  @override
  Widget build(BuildContext context) {
    globalContext = context;
    return Center(
      child: Consumer<ListMovieViewModel>(
        builder: (context, listMovieViewModel, child) {
          return Stack(children: [
            EasyRefresh.custom(
              header: BezierCircleHeader(backgroundColor: AppTheme.white, color: AppTheme.amberLight),
              footer: BezierBounceFooter(backgroundColor: AppTheme.white, color: AppTheme.amberLight),
              onRefresh: () async {
                await Future.delayed(Duration(seconds: 2), () {});
              },
              onLoad: () async {
                //widget.listOfMoviePresenter.firstLoad();
              },
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      imageMovie=imagesList[index % 3];
                      return (listMovieViewModel.ListMovies.length > 0)
                          ? MovieListItem(
                              item: listMovieViewModel.ListMovies[index],
                              index: index,
                              imageMovie: imageMovie,
                              listOfMoviePresenter: widget.listOfMoviePresenter,
                            )
                          : Container();
                    },
                    childCount: listMovieViewModel.ListMovies.length,
                  ),
                ),
              ],
            ),
            Positioned(
              child: listMovieViewModel.pageLoading
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
  void createBottomSheet(ListMovieViewModel listMovieViewModel, int index) async {
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
                    Container(width: width15Percent, child: imageMovie),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Title: " + listMovieViewModel.ListMovies[index].title,
                            style: AppTheme.lightBlackBig,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Producer: " + listMovieViewModel.ListMovies[index].producer,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTheme.lightBlackBig,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Director: " + listMovieViewModel.ListMovies[index].director,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTheme.lightBlackBig,
                          ),
                        ],
                      ),
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
                        "Characters: " +  listMovieViewModel.stringAllCharactersOfMovie,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
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

class MovieListItem extends StatefulWidget {
  Movie item;
  int index;
  ListOfMoviePresenter listOfMoviePresenter;
  Widget imageMovie;

  MovieListItem({this.item, this.index, this.imageMovie, this.listOfMoviePresenter});

  @override
  _MovieListItemState createState() => _MovieListItemState();
}

class _MovieListItemState extends State<MovieListItem> {
  Widget loadImage;

  @override
  Widget build(BuildContext context) {
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
                                    widget.item.title,
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
                                        "Director: " + widget.item.director,
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
                                        "Producer: " + widget.item.producer,
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
                              child: widget.imageMovie,
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
          widget.listOfMoviePresenter.onMovieClicked(
              widget.listOfMoviePresenter.getListOfMovieViewModel().ListMovies[widget.index].characters, widget.index);
        },
      ),
    );
  }
}
