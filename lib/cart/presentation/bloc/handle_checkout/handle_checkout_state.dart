part of 'handle_checkout_cubit.dart';

class HandleCheckoutState extends Equatable {
  bool isTermChecked = false;
  HandleCheckoutState({
    required this.isTermChecked});

  @override
  List<Object> get props => [
    isTermChecked,
  ];

  HandleCheckoutState copyWith({
    bool? isTermChecked,
  }) {
    return HandleCheckoutState(
      isTermChecked: isTermChecked ?? this.isTermChecked,
    );
  }

}

// class HandleCheckoutInitial extends HandleCheckoutState {}
