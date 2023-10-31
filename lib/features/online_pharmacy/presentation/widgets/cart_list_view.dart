import 'package:flutter/material.dart';
import 'package:medical_app/features/online_pharmacy/presentation/widgets/cart_list_view_item.dart';

class CartLisView extends StatelessWidget {
  const CartLisView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 2,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) =>
      const SizedBox(height: 15),
      itemBuilder: (context, index) {
        return CartListViewItem(
          imageUrl: 'https://i.ibb.co/MsBspRw/drug.png',
          title: 'OBH Combi',
          component: '75ml',
          price: 9.99,
        );
      },
    );
  }
}

