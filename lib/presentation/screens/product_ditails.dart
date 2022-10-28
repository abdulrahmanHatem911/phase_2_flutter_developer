import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phase_2_flutter_developer/core/utils/app_size.dart';
import 'package:phase_2_flutter_developer/core/utils/app_string.dart';
import 'package:phase_2_flutter_developer/presentation/controller/product_cubit.dart';
import 'package:phase_2_flutter_developer/presentation/controller/product_state.dart';
import 'package:phase_2_flutter_developer/presentation/widgets/price_company.dart';
import 'package:phase_2_flutter_developer/presentation/widgets/split_name.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => ProductCubit()
        ..extractDataJumia()
        ..extractPriceFromAmazon()
        ..extractPriceFromDubai(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "PriceRunner",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        body: BlocConsumer<ProductCubit, ProductState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = ProductCubit.get(context);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ProductCubit.productModelList.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 40.0),
                          width: width,
                          height: height * 0.4,
                          // color: Colors.purple.shade100,
                          child: Image.network(
                            "${ProductCubit.productModelList[0].image}",
                          ),
                        ),
                        //
                        ProductCubit.productModelList.isNotEmpty
                            ? Text(
                                ProductCubit.productModelList[0].title,
                                style: Theme.of(context).textTheme.headline2,
                              )
                            : const Text(''),
                        AppSize.sv_15,
                        SplitNameComponent(
                            name: ProductCubit.productModelList.isNotEmpty
                                ? ProductCubit.productModelList[0].title
                                : ''),
                        AppSize.sv_15,
                        Text(
                          AppString.discover,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        AppSize.sv_15,
                        PriceCompany(
                          image: ProductCubit.priceCompany[0]['image'],
                          price: ProductCubit.priceCompany[0]['price'],
                          productName: ProductCubit.priceCompany[0]['company'],
                        ),
                        AppSize.sv_15,
                        PriceCompany(
                          image: ProductCubit.priceCompany[1]['image'],
                          price: ProductCubit.productModelList[0].price
                              .split(' ')[1],
                          productName: ProductCubit.priceCompany[1]['company'],
                        ),
                        AppSize.sv_15,

                        PriceCompany(
                          image: ProductCubit.priceCompany[2]['image'],
                          price: ProductCubit.priceCompany[2]['price'],
                          productName: ProductCubit.priceCompany[2]['company'],
                        )
                      ],
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            );
          },
        ),
      ),
    );
  }
}
