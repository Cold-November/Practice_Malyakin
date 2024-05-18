import 'package:bloc/bloc.dart';

// Определение событий
abstract class CounterEvent {}

class Increment extends CounterEvent {}

class Decrement extends CounterEvent {}

// Определение состояний
class CounterState {
  final int counter;

  CounterState(this.counter);
}

// BLoC для управления состоянием счетчика
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<Increment>((event, emit) {
      if (state.counter < 5) {
        emit(CounterState(state.counter + 1));
      }
    });

    on<Decrement>((event, emit) {
      if (state.counter > 0) {
        emit(CounterState(state.counter - 1));
      }
    });
  }
}
