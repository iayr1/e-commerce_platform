import 'package:employee_management_app/ui/screens/add_product_screen.dart';
import 'package:employee_management_app/ui/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:employee_management_app/models/products_model.dart';
import 'package:employee_management_app/repos/product_repo.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ProductRepo productRepo = ProductRepo();
  List<ProductModel> allProducts = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    allProduct();
  }

  Future<void> allProduct() async {
    setState(() {
      isLoading = true;
    });
    try {
      final products = await productRepo.getProducts(); // Corrected method call
      setState(() {
        allProducts = products;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching products: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Products'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : allProducts.isNotEmpty
              ? ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: allProducts.length,
                  itemBuilder: (context, index) {
                    final product = allProducts[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(product: product),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            // Modified Image.network widget with loadingBuilder and errorBuilder
                            Image.network(
                              product.thumbnail ?? '',
                              width: 100,
                              fit: BoxFit.fitWidth,
                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child; // Image is fully loaded, display it
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress.expectedTotalBytes != null
                                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                          : null,
                                    ),
                                  ); // Show loading indicator while the image is loading
                                }
                              },
                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                return const Icon(Icons.error); // Show an error icon if image loading fails
                              },
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(product.title ?? ''),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : const Center(child: Text("No Products found!")),
              floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the screen for adding a product
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddProductScreen()),
          );
        },
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add), // Change the background color if needed
      ),
    );
  }
}
