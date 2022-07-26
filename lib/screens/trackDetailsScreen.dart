import 'package:credicxo_music_app/Blocs/trackDetails/trackdetails_bloc.dart';
import 'package:credicxo_music_app/models/track.dart';
import 'package:credicxo_music_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../Blocs/bloc/tracklyrics_dart_bloc.dart';
import '../Blocs/internet/internet_bloc.dart';
import 'noInternet/no_internet.dart';

class TrackDetailsScreen extends StatefulWidget {
  const TrackDetailsScreen({Key? key, required this.track}) : super(key: key);
  final Track track;

  @override
  State<TrackDetailsScreen> createState() => _TrackDetailsScreenState();
}

class _TrackDetailsScreenState extends State<TrackDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Track Details'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: BlocBuilder<InternetBloc, InternetState>(
          builder: (context, state) {
            if (state is InternetLoading) {
              return loading();
            }
            if (state is disconnected) {
              return const NoInternet();
            }
            if (state is connected) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: ListView(
                  children: [
                    TitleBody("Name", widget.track.trackName),
                    TitleBody("Artist", widget.track.artistName),
                    TitleBody("Album Name", widget.track.albumName),
                    TitleBody("Explicit", widget.track.explicit.toString()),
                    TitleBody("Rating", widget.track.trackRating.toString()),
                    BlocBuilder<TracklyricsDartBloc, TracklyricsDartState>(
                        builder: ((context, state) {
                      if (state is TracklyricsDartLoading) {
                        return loading();
                      }
                      if (state is TracklyricsDartLoaded) {
                        final lyrics = state.lyrics.lyricsBody;
                        return TitleBody("Lyrics", lyrics);
                      } else {
                        return error();
                      }
                    }))
                  ],
                ),
              );
            } else {
              return Scaffold(body: error());
            }
          },
        ));
  }
}
