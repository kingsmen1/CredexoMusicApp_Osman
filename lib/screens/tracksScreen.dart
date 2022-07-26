import 'package:credicxo_music_app/Blocs/bloc/tracklyrics_dart_bloc.dart';
import 'package:credicxo_music_app/Blocs/trackDetails/trackdetails_bloc.dart';
import 'package:credicxo_music_app/screens/trackDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Blocs/internet/internet_bloc.dart';
import '../utils/utils.dart';
import '../widgets/song_card.dart';
import 'noInternet/no_internet.dart';

class TracksScreen extends StatefulWidget {
  const TracksScreen({Key? key}) : super(key: key);

  @override
  State<TracksScreen> createState() => _TracksScreenState();
}

class _TracksScreenState extends State<TracksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Trending',
          ),
          centerTitle: true,
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
              return BlocBuilder<TrackdetailsBloc, TrackdetailsState>(
                builder: ((context, state) {
                  if (state is TrackdetailsLoding) {
                    return loading();
                  }
                  if (state is TrackdetailsCollected) {
                    var trackList = state.tracks;
                    return ListView.separated(
                      itemCount: trackList.length,
                      itemBuilder: ((context, index) {
                        final track = trackList[index];
                        //print(track.trackId);
                        return SongCard(
                            onClick: () {
                              BlocProvider.of<TracklyricsDartBloc>(context).add(
                                  loadTrackLyrics(trackid: track!.trackId));

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => TrackDetailsScreen(
                                        track: track,
                                      )));
                            },
                            trackName: track!.trackName,
                            authorName: track.artistName,
                            albumName: track.albumName);
                      }),
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(
                        height: 1,
                        thickness: 2,
                      ),
                    );
                  } else {
                    return error();
                  }
                }),
              );
            } else {
              return Scaffold(body: error());
            }
          },
        ));
  }
}
