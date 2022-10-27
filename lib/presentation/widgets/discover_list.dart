import 'package:flutter/material.dart';
import 'package:phase_2_flutter_developer/core/utils/dummy.dart';

import '../../core/utils/app_size.dart';

class DiscoverListComponent extends StatefulWidget {
  const DiscoverListComponent({super.key});

  @override
  State<DiscoverListComponent> createState() => _DiscoverListComponentState();
}

class _DiscoverListComponentState extends State<DiscoverListComponent> {
  bool discoverMore = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var priceList = Product.simpleData[0].productPriceList;
    List newPriceList = _sortList(priceList);

    return Expanded(
      child: Container(
        child: ListView.separated(
          itemCount: newPriceList.length,
          separatorBuilder: (context, index) => AppSize.sv_15,
          itemBuilder: (context, index) {
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
                      image:
                          NetworkImage("${newPriceList[index].companyImage}"),
                    ),
                  ),
                ),
                AppSize.sh_10,
                Text(
                  newPriceList[index].companyName,
                  style: Theme.of(context).textTheme.headline2,
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      "${newPriceList[index].companyPrice}",
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
          },
        ),
      ),
    );
  }

  List _sortList(List priceList) {
    List sortList = [];
    List newPriceList = [];
    for (int i = 0; i < priceList.length; i++) {
      sortList.add(priceList[i].companyPrice);
    }
    sortList.sort();
    for (int i = 0; i < priceList.length; i++) {
      for (int j = 0; j < priceList.length; j++) {
        if (sortList[i] == priceList[j].companyPrice) {
          newPriceList.add(priceList[j]);
        }
      }
    }
    return newPriceList;
  }
}
