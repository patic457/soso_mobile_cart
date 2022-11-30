import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'count_amount_event.dart';
part 'count_amount_state.dart';

class CountAmountBloc extends Bloc<CountAmountEvent, CountAmountState> {
  CountAmountBloc() : super(CountAmountInitial()) {
    on<CountAmountAddEvent>((event, emit) {
      emit(CountAmountCal(event.counter + 1));
    });

    on<CountAmountRemoveEvent>((event, emit) {
      if (event.counter - 1 > 0) {
        emit(CountAmountCal(event.counter - 1));
      }
      
      else {
        emit(CountAmountZero());
      }
    });
  }
}
