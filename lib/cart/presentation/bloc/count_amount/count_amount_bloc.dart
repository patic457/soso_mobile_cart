import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'count_amount_event.dart';
part 'count_amount_state.dart';

class CountAmountBloc extends Bloc<CountAmountEvent, CountAmountState> {
  CountAmountBloc() : super(CountAmountInitial()) {
    int res;
    on<CountAmountAddEvent>((event, emit) {
      res = event.counter + 1;
      emit(CountAmountCal(res));
      print("CountAmountAddEvent: " + res.toString());
    });

    on<CountAmountRemoveEvent>((event, emit) {
      res = event.counter - 1;
      if (res > 0) {
        emit(CountAmountCal(res));
      } else {
        emit(CountAmountZero());
      }
      print("CountAmountRemveEvent: " + res.toString());
    });
  }
}
