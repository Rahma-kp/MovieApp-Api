import 'package:flutter/material.dart';
import 'package:movie/constants/constants.dart';
import 'package:movie/model/model.dart';
import 'package:movie/service/api.dart';

class SearchProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  List<MovieModel> searchedResult = [];
  final ApiServices apiServices = ApiServices();

  void searchMovies(String query) async {
    if (query.isNotEmpty) {
      try {
        final searchUrl =
            "https://api.themoviedb.org/3/search/movie?query=$query&api_key=${ApiConstants.apiKey}";
        List<MovieModel> movies =
            await apiServices.searchMovie(searchUrl: searchUrl);

        searchedResult = movies;
        notifyListeners();
      } catch (e) {
        // print("Error: $e");
        Exception(e);
        notifyListeners();
      }
    } else {
      searchedResult = [];
      notifyListeners();
    }
  }
}
