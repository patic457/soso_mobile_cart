import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/app_bloc_observer.dart';
import 'package:marketplace/cart/presentation/bloc/checkout/checkout_bloc.dart';
import 'package:marketplace/cart/presentation/bloc/count_amount/count_amount_bloc.dart';
import 'package:marketplace/cart/presentation/bloc/list_payment_method/list_payment_method_bloc.dart';
import 'package:marketplace/cart/presentation/bloc/select_payment_method/select_payment_method_bloc.dart';
import 'package:marketplace/cart/presentation/pages/cart_page.dart';
import 'package:marketplace/cart/presentation/pages/checkout_page.dart';
import 'package:marketplace/cart/presentation/pages/payment_method_page.dart';
import 'package:marketplace/cart/presentation/pages/payment_method_sub_page.dart';
import 'package:marketplace/cart/presentation/pages/term_condition_page.dart';
import 'package:marketplace/injection.dart' as di;
import 'package:bloc/bloc.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Bloc.observer = AppBlocObserver();
    final args = settings.arguments;

    switch (settings.name) {
      case '/cart':
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => CountAmountBloc(),
              child: CartPage(),
            );
          },
        );
      case '/checkout':
        return MaterialPageRoute(
          builder: (context) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<CheckoutBloc>(
                    create: (context) => di.locator<CheckoutBloc>())
              ],
              child: const CheckoutPage(),
            );
          },
        );
      case 'payment-method':
        return MaterialPageRoute(
          builder: (context) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<ListPaymentMethodBloc>(
                  create: (context) => di.locator<ListPaymentMethodBloc>(),
                )
              ],
              child: const PaymentMethodListPage(),
            );
          },
        );
      case 'sub-payment-method':
        return MaterialPageRoute(
          builder: (context) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<SelectPaymentMethodBloc>(
                  create: (context) => di.locator<SelectPaymentMethodBloc>(),
                )
              ],
              child: PaymentMethodSubPage(),
            );
          },
        );
      case 'terms-conditions':
        return MaterialPageRoute(
          builder: (context) {
            return const TermConditionPage();
          },
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('Page not found.'),
          ),
        );
      },
    );
  }
}
