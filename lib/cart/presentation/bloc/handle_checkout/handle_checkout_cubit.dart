import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'handle_checkout_state.dart';

class HandleCheckoutCubit extends Cubit<HandleCheckoutState> {
  HandleCheckoutCubit() : super(HandleCheckoutState(isTermChecked: false));

  void termChecked() {
    emit(state.copyWith(isTermChecked: true));
  }

  void termUnChecked() {
    emit(state.copyWith(isTermChecked: false));
  }
}
