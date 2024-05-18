import 'package:employee_management_app/models/products_model.dart';
import 'package:employee_management_app/networking/api_endpoints.dart';
import 'package:employee_management_app/networking/dio_client.dart';

class ProductRepo {
  final DioClient _dioClient = DioClient();

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await _dioClient.get(path: ApiEndpoints.products);
      print('Response type: ${response.runtimeType}');
      print('Response data: ${response.data}');

      if (response.statusCode == 200) {
        if (response.data is Map<String, dynamic>) {
          final Map<String, dynamic> responseData = response.data;
          if (responseData.containsKey('products')) {
            final List<ProductModel> products = List<ProductModel>.from(
              responseData['products'].map((x) => ProductModel.fromJson(x)),
            );
            return products;
          }
        }
      }

      throw Exception('Failed to load products');
    } catch (e) {
      print('Error fetching products: $e');
      throw Exception('Error fetching products');
    }
  }

  Future<void> addProduct(ProductModel product) async {
    try {
      final response = await _dioClient.post(
        path: ApiEndpoints.postAddProducts,
        data: product.toJson(),
      );
      if (response.statusCode == 201) {
        print('Product added successfully');
      } else {
        throw Exception('Failed to add product');
      }
    } catch (e) {
      print('Error adding product: $e');
      throw Exception('Error adding product');
    }
  }

  Future<void> updateProduct(ProductModel product) async {
    try {
      final response = await _dioClient.put(
        path: '${ApiEndpoints.products}/${product.id}',
        data: product.toJson(),
      );
      if (response.statusCode == 200) {
        print('Product updated successfully');
      } else {
        throw Exception('Failed to update product');
      }
    } catch (e) {
      print('Error updating product: $e');
      throw Exception('Error updating product');
    }
  }

  Future<void> deleteProduct(int productId) async {
    try {
      final response = await _dioClient.delete(
        path: '${ApiEndpoints.products}/$productId', data: null,
      );
      if (response.statusCode == 204) {
        print('Product deleted successfully');
      } else {
        throw Exception('Failed to delete product');
      }
    } catch (e) {
      print('Error deleting product: $e');
      throw Exception('Error deleting product');
    }
  }

}
