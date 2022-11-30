part of 'count_amount_bloc.dart';

abstract class CountAmountState  {
    const CountAmountState();
       @override
  List<Object?> get props => [];

  set counter(int counter) {}
}

class CountAmountInitial extends CountAmountState{}

class CountAmountCal extends CountAmountState{
   final int counter;
  const CountAmountCal(this.counter);
    @override
  List<Object?> get props => [counter];
}

class CountAmountZero extends CountAmountState{
  const CountAmountZero();

  @override
  List<Object?> get props => [];

}