
import 'package:flutter/material.dart';
import 'package:nov_project/model/homeData.dart';

class CategoriesGrid extends StatelessWidget {
  final List<Categories> categories;
  const CategoriesGrid({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Our Categories',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Text(
                'View All',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    decoration: TextDecoration.underline),
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 200,
            child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
              itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    child: Image.network(
                      categories[index].image ?? '',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    categories[index].name ?? '',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,),
                  )
                ],
              ),
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}