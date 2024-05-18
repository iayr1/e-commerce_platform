import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _thumbnailController = TextEditingController();
  final TextEditingController _imagesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _discountController,
              decoration: const InputDecoration(labelText: 'Discount Percentage'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _ratingController,
              decoration: const InputDecoration(labelText: 'Rating'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _stockController,
              decoration: const InputDecoration(labelText: 'Stock'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _brandController,
              decoration: const InputDecoration(labelText: 'Brand'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _categoryController,
              decoration: const InputDecoration(labelText: 'Category'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _thumbnailController,
              decoration: const InputDecoration(labelText: 'Thumbnail URL'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _imagesController,
              decoration: const InputDecoration(labelText: 'Images URLs (comma separated)'),
            ),
            const SizedBox(height: 32.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Perform add product logic here
                  // You can access entered data using the controller values
                },
                child: const Text('Add Product'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _discountController.dispose();
    _ratingController.dispose();
    _stockController.dispose();
    _brandController.dispose();
    _categoryController.dispose();
    _thumbnailController.dispose();
    _imagesController.dispose();
    super.dispose();
  }
}
