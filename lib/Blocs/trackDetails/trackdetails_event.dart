part of 'trackdetails_bloc.dart';

abstract class TrackdetailsEvent extends Equatable {
  const TrackdetailsEvent();

  @override
  List<Object> get props => [];
}

class RevertValues extends TrackdetailsEvent {
  @override
  List<Object> get props => [];
}

class testFunction extends TrackdetailsEvent {}

class LoadTrackDetails extends TrackdetailsEvent {
  //final int trackId;

  LoadTrackDetails();

  @override
  List<Object> get props => [];
}

class UpdateTrackDetails extends TrackdetailsEvent {
  final int trackId;

  const UpdateTrackDetails({required this.trackId});
  @override
  List<Object> get props => [trackId];
}

class EmitTrackdetailsCollected extends TrackdetailsEvent {
  //final List<Track?> tracks;

  const EmitTrackdetailsCollected();
  @override
  List<Object> get props => [];
}
