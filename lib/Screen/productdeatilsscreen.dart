import 'package:flutter/material.dart';
import 'package:sephora/values/app_font_stye.dart';

class ProductDetails extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetails({super.key, required this.product});

  String _removeHtmlTags(String? htmlText) {
    if (htmlText == null) return 'No Description Available';
    final RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }

  @override
  Widget build(BuildContext context) {
    final variant =
        product['variants'] != null && product['variants'].isNotEmpty
            ? product['variants'][0]
            : null;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text(
          'Product Details',
          style: AppFontStyle.appbartitle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // if (product['thumbnail'] != null)
              //   Image.network(
              //     product['thumbnail'],
              //     height: 200,
              //     width: double.infinity,
              //     fit: BoxFit.cover,
              //   ),
              const SizedBox(height: 16),
              Text(product['title'] ?? 'No Title',
                  style: AppFontStyle.titlestylebluebold),
              const SizedBox(height: 8),
              Text(_removeHtmlTags(product['description']),
                  style: AppFontStyle.contentstyle),
              const SizedBox(height: 8),
              Text(
                  "Price: ₹${variant != null ? variant['price'] : product['priceStart'] ?? 'N/A'}",
                  style: AppFontStyle.contentstylegreenbold),
              const SizedBox(height: 8),
              Text(
                "Rating: ${(product['averageRating'] != null) ? product['averageRating'].toStringAsFixed(2) : 'No Rating'}",
                style: AppFontStyle.contentstylebluebold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
