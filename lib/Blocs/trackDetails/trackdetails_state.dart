part of 'trackdetails_bloc.dart';

abstract class TrackdetailsState extends Equatable {
  const TrackdetailsState();

  @override
  List<Object> get props => [];
}

class TrackdetailsLoding extends TrackdetailsState {}

class TrackdetailsCollected extends TrackdetailsState {
  final List<Track?> tracks;

  const TrackdetailsCollected({required this.tracks});
  @override
  List<Object> get props => [tracks];
}

class TrackdetailsLoaded extends TrackdetailsState {
  final Track track;

  TrackdetailsLoaded({required this.track});
  @override
  List<Object> get props => [track];
}
