import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './product_item.dart';
import '../providers/products.dart';
class ProductsGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products = productData.items;
    return GridView.builder(
      //use const to make sure don't change save performance
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ProductItem(
        products[i].id, 
        products[i].title, 
        products[i].imageUrl
      ),
      // Define structure of the grid wanna have 2 column
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, 
        childAspectRatio: 3 / 2, 
        crossAxisSpacing: 10, 
        mainAxisSpacing: 10,
      ),
    );
  }
}