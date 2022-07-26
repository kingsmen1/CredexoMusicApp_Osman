part of 'tracklyrics_dart_bloc.dart';

abstract class TracklyricsDartEvent extends Equatable {
  const TracklyricsDartEvent();

  @override
  List<Object> get props => [];
}

class loadTrackLyrics extends TracklyricsDartEvent {
  final int trackid;

  loadTrackLyrics({required this.trackid});

  @override
  List<Object> get props => [trackid];
}

class UpdateTrackLyrics extends TracklyricsDartEvent {
  final Lyrics lyrics;

  UpdateTrackLyrics({required this.lyrics});

  @override
  List<Object> get props => [lyrics];
}

class ResetData extends TracklyricsDartEvent {
  @override
  List<Object> get props => [];
}
