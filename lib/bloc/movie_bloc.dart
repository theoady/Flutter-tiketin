import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:flutter/semantics.dart';
// import 'package:tiketin/bloc/blocs.dart';
import 'package:tiketin/models/models.dart';
import 'package:tiketin/services/services.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial());

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    // page 1 = 20 movie
    if (event is FetchMovies) {
      List<Movie> movies = await MovieServices.getMovies(1);

      yield MovieLoaded(movies: movies);
    }
  }
}
