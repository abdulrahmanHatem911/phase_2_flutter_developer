class Product {
  final String name;
  final String image;
  final List<ProductPrice> productPriceList;
  Product({
    required this.name,
    required this.image,
    required this.productPriceList,
  });
  static List<Product> simpleData = [
    Product(
      name: 'Apple AirPods Pro 2',
      image: 'https://m.media-amazon.com/images/I/61sRKTAfrhL._AC_SL1500_.jpg',
      productPriceList: [
        ProductPrice(
          companyName: 'Amazon EG',
          companyImage:
              "https://scontent.fcai19-4.fna.fbcdn.net/v/t39.30808-6/240665130_367643941683498_4069018056976024338_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFdApjbVXwkBJE-X0WhWV-qc2RBtM45P7dzZEG0zjk_t9HU66-vdS5uUCGyMfH10-8SmlmHn745mzJBASHD2iwU&_nc_ohc=zAjpDMP8EtYAX8K4ayi&_nc_ht=scontent.fcai19-4.fna&oh=00_AT_z2QHCx7w5S_bGkV5JtfjN70eGcED4iYTkaoZdJmRfcg&oe=635D63EE",
          companyPrice: 8150,
        ),
        ProductPrice(
          companyName: "Jumia Egypt",
          companyImage:
              "https://d1b3667xvzs6rz.cloudfront.net/2018/09/jumia-2-700x430.jpg",
          companyPrice: 8499,
        ),
        ProductPrice(
          companyName: "Dubai Phone",
          companyImage:
              "https://play-lh.googleusercontent.com/qOVG4yZu0tbZF5QSVGZDVM8OUOyjI_TAUUS9Ybpip4If_KR9OmyT9j2ywy8mSqYLdg",
          companyPrice: 7999,
        ),
      ],
    ),
  ];
}

class ProductPrice {
  final String companyName;
  final String companyImage;
  final int companyPrice;
  ProductPrice({
    required this.companyName,
    required this.companyImage,
    required this.companyPrice,
  });
}
