part of 'internet_bloc.dart';

abstract class InternetEvent extends Equatable {
  const InternetEvent();

  @override
  List<Object> get props => [];
}

class loadInternet extends InternetEvent {}

class EmitConnected extends InternetEvent {}

class EmitNotConnected extends InternetEvent {}
