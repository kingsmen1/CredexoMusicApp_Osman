import 'package:credicxo_music_app/Blocs/bloc/tracklyrics_dart_bloc.dart';
import 'package:credicxo_music_app/Blocs/trackDetails/trackdetails_bloc.dart';
import 'package:credicxo_music_app/repositories/getTracksRepo.dart';
import 'package:credicxo_music_app/repositories/trackDetailsRepo.dart';
import 'package:credicxo_music_app/screens/tracksScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'Blocs/internet/internet_bloc.dart';
import 'Blocs/trackList/tracklist_bloc.dart';
import 'repositories/lyricsRepo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                InternetBloc(InternetConnectionChecker())..add(loadInternet())),
        BlocProvider(
            create: (context) => TracklistBloc(getTracksRepo: GetTracksRepo())
              ..add(LoadTrackList())),
        BlocProvider(
            create: (context) => TrackdetailsBloc(
                trackDetailsRepo: TrackDetailsRepo(),
                trackdetailsBloc: BlocProvider.of<TracklistBloc>(context))),
        BlocProvider(
            create: (_) => TracklyricsDartBloc(lyricsRepo: LyricsRepo())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TracksScreen(),
      ),
    );
  }
}
