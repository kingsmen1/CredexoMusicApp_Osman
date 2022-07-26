part of 'tracklist_bloc.dart';

abstract class TracklistEvent extends Equatable {
  const TracklistEvent();
  @override
  List<Object> get props => [];
}

class LoadTrackList extends TracklistEvent {}

class UpdateTrackList extends TracklistEvent {
  final List<TrackList?> tracks;

  const UpdateTrackList(this.tracks);
  @override
  List<Object> get props => [tracks];
}
