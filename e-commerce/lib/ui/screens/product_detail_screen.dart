import 'package:employee_management_app/models/products_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title ?? 'No Title',
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              product.description ?? 'No Description',
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Price: \$${product.price ?? 0}',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            if (product.discountPercentage != null)
              Text(
                'Discount: ${product.discountPercentage}% off',
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.red,
                ),
              ),
            const SizedBox(height: 16.0),
            Text(
              'Rating: ${product.rating ?? 0}',
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Stock: ${product.stock ?? 0}',
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Brand: ${product.brand ?? 'Unknown'}',
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Category: ${product.category ?? 'Uncategorized'}',
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 16.0),
            Image.network(
              product.thumbnail ?? '',
              height: 200,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            if (product.images != null && product.images!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Other Images:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    physics: const NeverScrollableScrollPhysics(),
                    children: product.images!.map<Widget>((image) {
                      return Image.network(
                        image,
                        fit: BoxFit.cover,
                      );
                    }).toList(),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
