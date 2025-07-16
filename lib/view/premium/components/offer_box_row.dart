import 'package:datingcase/view/premium/components/atom/offer_box.dart';
import 'package:flutter/material.dart';

class OfferBoxRow extends StatelessWidget {
  const OfferBoxRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OfferBox(
          discountNumber: '+10%',
          oldNumber: '200',
          newNumber: '300',
          price: '₺99,99',
        ),
        OfferBox(
          discountNumber: '+70%',
          oldNumber: '2000',
          newNumber: '3375',
          price: '₺799,99',
          isMiddle: true,
        ),
        OfferBox(
          discountNumber: '+35%',
          oldNumber: '1000',
          newNumber: '1350',
          price: '₺399,99',
        ),
      ],
    );
  }
}
