import 'package:flutter/material.dart';

import '../screens/abstract.dart';
import '../screens/animals.dart';
import '../screens/cars.dart';
import '../screens/cityscapes.dart';
import '../screens/nature.dart';
import '../screens/portraits.dart';
import '../screens/space.dart';

class CategoryContainer extends StatelessWidget {
  final String category;

  const CategoryContainer({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switch (category) {
          case 'Nature':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NatureScreen()),
            );
            break;
          case 'Abstract':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AbstractScreen()),
            );
            break;
          case 'Cityscapes':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CityscapesScreen()),
            );
            break;
          case 'Animals':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AnimalsScreen()),
            );
            break;
          case 'Space':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SpaceScreen()),
            );
            break;
          case 'Cars':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CarsScreen()),
            );
            break;
          case 'Portraits':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PortraitsScreen()),
            );
            break;
          // Add other cases for each category
        }
      },
      child: Container(
        height: 200,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: AssetImage(
                'assets/images/$category.png'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              color: Colors.black.withOpacity(0.5),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Text(
              category,
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
