// cubit for product
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phase_2_flutter_developer/presentation/controller/product_state.dart';

import '../../data/models/web_produnct_model.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitialState());
  static ProductCubit get(context) => BlocProvider.of(context);
  static List<ProductModel> productModelList = [];
  static List priceCompany = [
    {
      'company': 'Amazon EG',
      'image':
          'https://scontent.fcai19-4.fna.fbcdn.net/v/t39.30808-6/240665130_367643941683498_4069018056976024338_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFdApjbVXwkBJE-X0WhWV-qc2RBtM45P7dzZEG0zjk_t9HU66-vdS5uUCGyMfH10-8SmlmHn745mzJBASHD2iwU&_nc_ohc=zAjpDMP8EtYAX8K4ayi&_nc_ht=scontent.fcai19-4.fna&oh=00_AT_z2QHCx7w5S_bGkV5JtfjN70eGcED4iYTkaoZdJmRfcg&oe=635D63EE',
      'price': '',
    },
    {
      'company': 'Jumia Egypt',
      'image':
          'https://d1b3667xvzs6rz.cloudfront.net/2018/09/jumia-2-700x430.jpg',
      'price': '',
    },
    {
      'company': 'Dubai Phone',
      'image':
          'https://play-lh.googleusercontent.com/qOVG4yZu0tbZF5QSVGZDVM8OUOyjI_TAUUS9Ybpip4If_KR9OmyT9j2ywy8mSqYLdg',
      'price': '',
    },
  ];
  Future<void> extractDataJumia() async {
    String titleProduct = '';
    String priceProduct = '';
    String imageProduct = '';
    emit(ProductJumiaLoadedState());
    final response = await http.Client().get(Uri.parse(
        'https://www.jumia.com.eg/apple-airpods-pro-2nd-generation-white-31064038.html'));
    if (response.statusCode == 200) {
      try {
        // Parsing the response
        final document = parser.parse(response.body);
        // Extracting the data

        BeautifulSoup bs = BeautifulSoup(document.outerHtml);
        titleProduct = bs.find("h1", class_: "-pts")!.text;
        priceProduct = bs.find("span", class_: "-b -ltr -tal -fs24")!.text;
        imageProduct =
            bs.find("div", id: "imgs")!.find("img")!.attributes['data-src']!;
        productModelList.add(ProductModel(
            title: titleProduct, price: priceProduct, image: imageProduct));
        emit(ProductJumiaLoadedState());
      } catch (e) {
        emit(ProductJumiaErrorState());
        print(e);
      }
    }
  }

  Future<String> extractPriceFromAmazon() async {
    String amazonPrice = '';
    emit(ProductAmazonLoadingState());
    final response = await http.Client()
        .get(Uri.parse('https://www.amazon.eg/dp/B0BDK4GJXC'));
    if (response.statusCode == 200) {
      try {
        final document = parser.parse(response.body);
        BeautifulSoup bs = BeautifulSoup(document.outerHtml);
        amazonPrice = bs.find("span", class_: "a-price-whole")!.text;

        priceCompany[0]['price'] = amazonPrice;
        emit(ProductAmazonLoadedState());
      } catch (e) {
        emit(ProductAmazonErrorState());
        print(e);
      }
    }
    return amazonPrice;
  }

  Future<String> extractPriceFromDubai() async {
    String douaiPrice = '';
    emit(ProductDubaiLoadedState());
    final response = await http.Client().get(Uri.parse(
        'https://www.dubaiphone.net/en/shop/apple-airpods-pro-2-3606#attr=10545,10609,10608,10546,10610'));
    if (response.statusCode == 200) {
      try {
        final document = parser.parse(response.body);
        BeautifulSoup bs = BeautifulSoup(document.outerHtml);
        douaiPrice = bs
            .find("b", class_: "oe_price")!
            .find("span", class_: "oe_currency_value")!
            .text;
        priceCompany[2]['price'] = douaiPrice;
        emit(ProductDubaiLoadedState());
      } catch (e) {
        emit(ProductDubaiErrorState());
        print(e);
      }
    }
    return douaiPrice;
  }
}
