import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:startwarsmovies/Constatnts/ConstantClass.dart';
import 'package:startwarsmovies/utils/UrlUtils.dart';
import 'package:startwarsmovies/web_services/response/MoviesResponse.dart';
import 'package:startwarsmovies/web_services/response/PeopleResponse.dart';
import 'package:startwarsmovies/web_services/response/SubMovieResponse.dart';
import 'package:startwarsmovies/web_services/response/SubPeopleResponse.dart';

class WebServiceRepository {
  var http;

  void setCertificateVerify() {
    //solve flutter CERTIFICATE_VERIFY_FAILED error while performing a POST request
    final ioc = new HttpClient();
    ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    http = new IOClient(ioc);
  }

  //-------------------------------------------------------------------------------------------
  ///get movies List
  Future<MoviesResponse> getMoviesList(
      {int index = 0, String movieName = "", String paging = "", String nextUrl = ""}) async {
    MoviesResponse moviesResponse;

    //solve flutter CERTIFICATE_VERIFY_FAILED error while performing a POST request
    setCertificateVerify();

    final Response response = await http.get(
      makeUrl(isMovieOrPeople: true, index: index, name: movieName, paging: paging, nextUrl: nextUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      moviesResponse = MoviesResponse.fromJson(json.decode(response.body));
      return moviesResponse;
    } else {
      return MoviesResponse();
    }
  }

  //-------------------------------------------------------------------------------------------
  //get people list
  Future<PeopleResponse> getPeopleList(
      {int index = 0, String peopleName = "", String paging = "", String nextUrl = ""}) async {
    PeopleResponse peopleResponse;

    //solve flutter CERTIFICATE_VERIFY_FAILED error while performing a POST request
    setCertificateVerify();

    final Response response = await http.get(
      makeUrl(isMovieOrPeople: false, index: index, name: peopleName, paging: paging),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      peopleResponse = PeopleResponse.fromJson(json.decode(response.body));
      return peopleResponse;
    } else {
      return PeopleResponse();
    }
  }

  //-------------------------------------------------------------------------------------------
  ///get all people in a movie
  Future<SubPeopleResponse> getCharactersInMovie(String peopleLink) async {
    SubPeopleResponse peopleResponse;

    //solve flutter CERTIFICATE_VERIFY_FAILED error while performing a POST request
    setCertificateVerify();

    Response response = await http.get(
      peopleLink,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      peopleResponse = SubPeopleResponse.fromJson(json.decode(response.body));
    } else {
      peopleResponse = null;
    }

    return peopleResponse;
  }

  //-------------------------------------------------------------------------------------------
  ///get all movies of a character
  Future<SubMovieResponse> getMoviesOfACharacter(String movieUrl) async {
    SubMovieResponse subMovieResponse = SubMovieResponse();

    //solve flutter CERTIFICATE_VERIFY_FAILED error while performing a POST request
    setCertificateVerify();

    // movieLinks.forEach((movieUrl)  async {
    Response response = await http.get(
      movieUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      subMovieResponse = SubMovieResponse.fromJson(json.decode(response.body));
    } else {
      subMovieResponse = null;
    }
    // });
    return subMovieResponse;
  }
}
