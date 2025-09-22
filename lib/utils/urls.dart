class Urls {
  static const String _baseUrl = 'http://35.73.30.144:2008/api/v1';

  static const String getProductUrl = '$_baseUrl/ReadProduct';

  // static const String addProduct = '$_baseUrl/products/add';
  // static const String updateProduct = '$_baseUrl/products/update';
  static String deleteProduct(String id) {
    return '$_baseUrl/DeleteProduct/$id';
  }

  //
}
