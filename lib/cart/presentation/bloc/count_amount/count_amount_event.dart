part of 'count_amount_bloc.dart';

abstract class CountAmountEvent  {
  const CountAmountEvent();
  @override
  List<Object> get props => [];
}

class CountAmountAddEvent extends CountAmountEvent{
  final int counter;
  const CountAmountAddEvent(this.counter);
  @override
  List<Object> get props => [counter];
}

class CountAmountRemoveEvent extends CountAmountEvent{
  final int counter;
  const CountAmountRemoveEvent(this.counter);
  @override
  List<Object> get props => [counter];
}