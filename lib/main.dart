import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tiketin/bloc/movie_bloc.dart';

import 'package:tiketin/bloc/page_bloc.dart';
import 'package:tiketin/bloc/ticket_bloc.dart';
import 'package:tiketin/services/services.dart';

import 'ui/pages/pages.dart';
import 'bloc/blocs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return StreamProvider.value(
      value: AuthServices.userStream,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => PageBloc()),
          BlocProvider(create: (_) => UserBloc()),
          BlocProvider(create: (_) => ThemeBloc()),
          BlocProvider(
            create: (_) => MovieBloc()..add(FetchMovies()),
          ),
          BlocProvider(
            create: (_) => TicketBloc(),
          )
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (_, themeState) => MaterialApp(
            theme: themeState.themeData,
            debugShowCheckedModeBanner: false,
            home: Wrapper(),
          ),
        ),
      ),
    );
  }
}
