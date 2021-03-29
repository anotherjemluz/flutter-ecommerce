import 'package:ecommerce/models/Product.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = '/details';
  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments arguments =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(rating: arguments.product.rating),
      body: Body(product: arguments.product),
    );
  }
}

// precisa passar o produto como argumento de uma página para a outra, através dessa classe
class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({@required this.product});
}
