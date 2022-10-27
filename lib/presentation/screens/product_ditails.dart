import 'package:flutter/material.dart';
import 'package:phase_2_flutter_developer/core/utils/app_size.dart';
import 'package:phase_2_flutter_developer/core/utils/app_string.dart';
import 'package:phase_2_flutter_developer/core/utils/dummy.dart';
import 'package:phase_2_flutter_developer/presentation/widgets/split_name.dart';

import '../widgets/discover_list.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "PriceRunner",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              width: width,
              height: height * 0.4,
              // color: Colors.purple.shade100,
              child: Image(
                image: NetworkImage(Product.simpleData[0].image),
              ),
            ),
            Text(
              Product.simpleData[0].name,
              style: Theme.of(context).textTheme.headline2,
            ),
            AppSize.sv_15,
            SplitNameComponent(name: Product.simpleData[0].name),
            AppSize.sv_15,
            Text(
              AppString.discover,
              style: Theme.of(context).textTheme.headline3,
            ),
            AppSize.sv_15,
            const DiscoverListComponent(),
          ],
        ),
      ),
    );
  }
}
