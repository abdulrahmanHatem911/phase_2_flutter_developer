import 'package:flutter/material.dart';
import '../../core/utils/app_size.dart';
import '../controller/product_cubit.dart';

class PriceCompany extends StatelessWidget {
  final String? image;
  final String? price;
  final String? productName;
  const PriceCompany({super.key, this.image, this.price, this.productName});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Container(
          width: width * 0.15,
          height: height * 0.07,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey, width: 1.0),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                image ?? "",
              ),
            ),
          ),
        ),
        AppSize.sh_10,
        Text(
          "${productName}",
          style: Theme.of(context).textTheme.headline2,
        ),
        const Spacer(),
        Row(
          children: [
            Text(
              price ?? "",
              style: Theme.of(context).textTheme.headline2,
            ),
            AppSize.sh_5,
            Text(
              'EGP',
              style: Theme.of(context).textTheme.headline5,
            )
          ],
        )
      ],
    );
  }
}
