import 'package:startwarsmovies/constatnts/ConstantClass.dart';

/*
make url base of parameter
 */
String makeUrl({bool isMovieOrPeople, int index, String name = "", String paging = "", String nextUrl = ""}) {
  if (nextUrl.isNotEmpty)
    return nextUrl;
  else {
    //select resource
    String resource = isMovieOrPeople ? moviesSubDomain : peopleSubDomain;
    //which index of movie or people
    String indexString = index > 0 ? slash + index.toString() : "";
    //one of search or paging together has value
    String subDomainUrl = (name.isNotEmpty || paging.isNotEmpty) ? subDomain : "";
    //both of search and paging together
    String andSectionUrl = (name.isNotEmpty && paging.isNotEmpty) ? andSection : "";
    //find all people by contain name
    String searchSection = name.isNotEmpty ? searchSubDomain + name : "";
    //next page of people
    String pagingSection = paging.isNotEmpty ? pagingSubDomain + paging : "";
    //return url value
    return baseUrl + resource + indexString + subDomainUrl + searchSection + andSectionUrl + pagingSection;
  }
}
