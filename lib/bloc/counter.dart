import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent {}

class IncrementBotton extends CounterEvent {}

class DecrementBottom extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent,int> {
CounterBloc() : super(0) {
  on<IncrementBotton>((event, emit) {
    emit(state + 1);
  } ,);

    on<DecrementBottom>((event, emit) {
      if(state > 0) {

    emit(state - 1);
      }
  } ,);
}
}