part of 'tracklyrics_dart_bloc.dart';

abstract class TracklyricsDartState extends Equatable {
  const TracklyricsDartState();

  @override
  List<Object> get props => [];
}

class TracklyricsDartLoading extends TracklyricsDartState {
  @override
  List<Object> get props => [];
}

class TracklyricsDartLoaded extends TracklyricsDartState {
  final Lyrics lyrics;

  TracklyricsDartLoaded({required this.lyrics});

  @override
  List<Object> get props => [lyrics];
}
