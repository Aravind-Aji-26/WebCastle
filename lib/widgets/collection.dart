import 'package:flutter/material.dart';
import 'package:nov_project/model/homeData.dart';

class CollectionList extends StatelessWidget {
  final List<Products> products;
  final String title;
  const CollectionList({Key? key, required this.products, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              const Text(
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
            height: 310,
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ProductCard(product: products[index]),
              ),
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Products product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xffF1F1F1),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(
                product.offer ?? '',
                style: const TextStyle(
                    color: Color(0xff10AD0D),
                    fontSize: 12,),
              ),
              const Icon(Icons.favorite_border_outlined,size: 20,)
            ],),
            Image.network(
              product.image ?? '',
              fit: BoxFit.contain,height: 110,
            ),
            Text(
              product.name ?? 'Product Name',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,fontWeight: FontWeight.w600),
            ),
            Text(
              product.price.toString() ?? '',
              style: const TextStyle(
                  color: Color(0xff939393),
                  fontSize: 13,fontWeight: FontWeight.w600,decoration: TextDecoration.lineThrough),
            ),
            Text(
              product.actualPrice.toString() ?? '',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    border: Border.all(
                      color: const Color(0xffE8E8E8),
                    ),

                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'RFQ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                   color: const Color(0xffFF2021)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
