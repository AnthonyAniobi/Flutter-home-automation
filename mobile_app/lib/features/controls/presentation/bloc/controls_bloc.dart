import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'controls_event.dart';
part 'controls_state.dart';

class ControlsBloc extends Bloc<ControlsEvent, ControlsState> {
  ControlsBloc() : super(ControlsInitial()) {
    on<ControlsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
