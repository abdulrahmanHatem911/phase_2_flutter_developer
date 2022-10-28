// state for app
abstract class ProductState {}

class ProductInitialState extends ProductState {}

class ProductJumiaLoadingState extends ProductState {}

class ProductJumiaLoadedState extends ProductState {}

class ProductJumiaErrorState extends ProductState {}

class ProductAmazonLoadingState extends ProductState {}

class ProductAmazonLoadedState extends ProductState {}

class ProductAmazonErrorState extends ProductState {}

class ProductDubaiLoadingState extends ProductState {}

class ProductDubaiLoadedState extends ProductState {}

class ProductDubaiErrorState extends ProductState {}
