import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soso_mobile_cart/cart/presentation/bloc/count_amount/count_amount_bloc.dart';
import 'package:soso_mobile_cart/cart/presentation/bloc/list_payment_method/list_payment_method_bloc.dart';
import 'package:soso_mobile_cart/cart/presentation/pages/cart_page.dart';
import 'package:soso_mobile_cart/cart/presentation/pages/checkout_page.dart';
import 'package:soso_mobile_cart/cart/presentation/pages/payment_method_page.dart';
import 'package:soso_mobile_cart/injection.dart' as di;
import 'package:bloc/bloc.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
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
            return const CheckoutPage();
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
