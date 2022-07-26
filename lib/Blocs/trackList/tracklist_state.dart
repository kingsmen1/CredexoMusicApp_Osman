part of 'tracklist_bloc.dart';

@immutable
abstract class TracklistState extends Equatable {
  const TracklistState();

  @override
  List<Object> get props => [];
}

class TracklistLoading extends TracklistState {}

class TracklistLoaded extends TracklistState {
  final List<TrackList?> tracks;

  TracklistLoaded({this.tracks = const <TrackList?>[]});

  @override
  List<Object> get props => [tracks];
}
