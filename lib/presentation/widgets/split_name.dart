import 'package:flutter/material.dart';
import 'package:phase_2_flutter_developer/core/utils/app_size.dart';

class SplitNameComponent extends StatelessWidget {
  final String name;
  const SplitNameComponent({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var listItems = _splitNameFunction();
    return SizedBox(
      width: width,
      height: height * 0.04,
      //color: Colors.purple.shade100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => AppSize.sh_15,
        itemCount: listItems.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Center(
              child: Text(
                listItems[index],
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          );
        },
      ),
    );
  }

  List<String> _splitNameFunction() {
    var splitName = name.split(' ');
    return splitName;
  }
}
