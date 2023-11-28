import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/pages/product_categories.dart';

class CategoriesHome extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const CategoriesHome({Key? key});

  @override
  State<StatefulWidget> createState() => _CategoriesHomeState();
}

class _CategoriesHomeState extends State<CategoriesHome> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // First Child Container Fresh Meat
            buildCategoryContainer(
              'Food',
              'https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxtZWF0fGVufDB8fHx8MTY5NjM5MjA5MXww&ixlib=rb-4.0.3&q=80&w=1080',
            ),

            // Second Child Container Sauces
            buildCategoryContainer(
              'Sauces',
              'https://images.unsplash.com/photo-1472476443507-c7a5948772fc?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxzYXUd7lNeHNE4eTlAWfHx8fDE2OTYzOTIwNzZ8MA&ixlib=rb-4.0.3&q=80&w=1080',
            ),

            // Third Child Container Ramen
            buildCategoryContainer(
              'Ramen',
              'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxyYW1lbnxlbnwwfHx8fDE2OTYzOTIwMjl8MA&ixlib=rb-4.0.3&q=80&w=1080',
            ),

            // Fourth Child Container Beverages
            buildCategoryContainer(
              'Beverages',
              'https://images.unsplash.com/photo-1562749606-0a9eb5a8a0f3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxzYW1neWV0YW5nfGVufDB8fHx8MTY5NjQyNDA4MXww&ixlib=rb-4.0.3&q=80&w=1080',
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build category containers
  Widget buildCategoryContainer(String categoryName, String imageUrl) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
      child: GestureDetector(
        onTap: () {
          // Navigate to the CategoryItemsPage when a category is tapped
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CategoryItemsPage(categoryName: categoryName),
            ),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 75,
              height: 75,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Container(
                width: 120,
                height: 120,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              categoryName,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
