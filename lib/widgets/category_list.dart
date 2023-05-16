import 'package:flutter/material.dart';
import 'package:wallpappers/widgets/category_container.dart';



class CategoryList extends StatelessWidget {
  final List<String> categories = [
    'Abstract',
    'Space',
    'Nature',
    'Portraits',
    'Cityscapes',
    'Animals',
    'Cars',
    // Add more categories here
  ];

  CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryContainer(category: categories[index]);
      },
    );
  }
}