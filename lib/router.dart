import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_member/member/presentation/bloc/bloc.dart';
import 'package:marketplace_member/member/presentation/bloc/delivery_address_member_bloc/delivery_address_member_bloc.dart';

import 'package:marketplace_member/member/presentation/pages/pages.dart';
import 'package:soso_mobile_cart/app_bloc_observer.dart';
import 'package:soso_mobile_cart/cart/presentation/bloc/checkout/checkout_bloc.dart';
import 'package:soso_mobile_cart/cart/presentation/bloc/count_amount/count_amount_bloc.dart';
// import 'package:soso_mobile_cart/cart/presentation/bloc/delivery_address/delivery_address_bloc.dart';
import 'package:soso_mobile_cart/cart/presentation/bloc/handle_checkout/handle_checkout_cubit.dart';
import 'package:soso_mobile_cart/cart/presentation/bloc/list_payment_method/list_payment_method_bloc.dart';
import 'package:soso_mobile_cart/cart/presentation/bloc/select_payment_method/select_payment_method_bloc.dart';
import 'package:soso_mobile_cart/cart/presentation/pages/cart_page.dart';
import 'package:soso_mobile_cart/cart/presentation/pages/checkout_page.dart';
import 'package:soso_mobile_cart/cart/presentation/pages/payment_method_page.dart';
import 'package:soso_mobile_cart/cart/presentation/pages/payment_method_sub_page.dart';
import 'package:soso_mobile_cart/cart/presentation/pages/term_condition_page.dart';
import 'package:soso_mobile_cart/injection.dart' as di;
import 'package:bloc/bloc.dart';

import 'cart/presentation/bloc/delivery_address/delivery_address_bloc.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Bloc.observer = AppBlocObserver();
    final args = settings.arguments;

    switch (settings.name) {
      case '/marketplace_member/member':
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<MemberBloc>(
                create: (context) => di.locator<MemberBloc>(),
              ),
              BlocProvider<IsCompleteFormCubit>(
                create: (context) => di.locator<IsCompleteFormCubit>(),
              )
            ],
            child: AddAddressPage(
              titleText: 'Add new address',
            ),
          ),
        );
      case '/marketplace_member/addresslist':
        return MaterialPageRoute(
          builder: (context) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<DeliveryAddressMemberBloc>(
                    create: (context) =>
                        di.locator<DeliveryAddressMemberBloc>())
              ],
              child: AddressListPage(),
            );
          },
        );
      case '/cart':
        return MaterialPageRoute(
          builder: (context) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<CheckoutBloc>(
                  create: (context) => di.locator<CheckoutBloc>(),
                ),
                BlocProvider<CountAmountBloc>(
                  create: (context) => CountAmountBloc(),
                )
              ],
              child: CartPage(),
            );
          },
        );
      case '/checkout':
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return MultiBlocProvider(
              providers: [
                //
                // BlocProvider<DeliveryAddressMemberBloc>(
                //   create: (context) => di.locator<DeliveryAddressMemberBloc>(),
                // ),
                //
                BlocProvider<CheckoutBloc>(
                  create: (context) => di.locator<CheckoutBloc>(),
                ),
                BlocProvider.value(
                  value: di.locator<SelectPaymentMethodBloc>(),
                ),
                BlocProvider<DeliveryAddressBloc>(
                  create: (context) => di.locator<DeliveryAddressBloc>(),
                ),
                BlocProvider<HandleCheckoutCubit>(
                  create: (context) => di.locator<HandleCheckoutCubit>(),
                )
              ],
              child: const CheckoutPage(),
            );
          },
        );
      case '/payment-method':
        return MaterialPageRoute(
          builder: (context) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<ListPaymentMethodBloc>(
                  create: (context) => di.locator<ListPaymentMethodBloc>(),
                ),
                BlocProvider.value(
                  value: di.locator<SelectPaymentMethodBloc>(),
                ),
              ],
              child: const PaymentMethodListPage(),
            );
          },
        );
      case '/sub-payment-method':
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(
              value: di.locator<SelectPaymentMethodBloc>(),
              child: PaymentMethodSubPage(),
            );
            // return BlocProvider.value(
            //   value: di.locator<SelectPaymentMethodBloc>(),
            //   child: PaymentMethodSubPage(),
            // );
          },
        );
      case '/terms-conditions':
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
