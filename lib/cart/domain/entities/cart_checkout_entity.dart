import 'package:equatable/equatable.dart';

import 'package:marketplace/cart/domain/entities/cart_checkout_item_entity.dart';

class CartCheckoutEntity extends Equatable {
  final String id;
  final List<CartItemCheckoutEntity>? cartsItems;
  final MemberEntity? member;
  final double subTotalIncTax;
  final double totalIncTax;

  const CartCheckoutEntity({
    required this.id,
    this.cartsItems,
    this.member,
    required this.subTotalIncTax,
    required this.totalIncTax,
  });
  @override
  List<Object?> get props => [
        id,
        cartsItems,
        member,
        subTotalIncTax,
        totalIncTax,
      ];
}

class MemberEntity extends Equatable {
  final String? memberId;
  final String? username;

  const MemberEntity({ this.memberId,  this.username});

  @override
  List<Object?> get props => [{
        memberId,
        username,
      }];
}
