import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final InternetConnectionChecker _internetConnectionChecker;
  StreamSubscription? InternetSubscription;
  InternetBloc(InternetConnectionChecker internetConnectionChecker)
      : _internetConnectionChecker = internetConnectionChecker,
        super(InternetLoading()) {
    on<loadInternet>(_loadInternet);
    on<EmitConnected>((event, emit) => emit(connected()));
    on<EmitNotConnected>((event, emit) => emit(disconnected()));
  }

  _loadInternet(loadInternet event, Emitter<InternetState> emit) {
    print('loainternet');
    InternetSubscription?.cancel();
    InternetSubscription =
        _internetConnectionChecker.onStatusChange.listen((event) {
      final isConnected = event == InternetConnectionStatus.connected;
      if (isConnected) {
        add(EmitConnected());
        print('EmitConnected');
      } else {
        add(EmitNotConnected());
        print('EmitNotConnected');
      }
    });
  }
}
