import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sephora/Screen/productdeatilsscreen.dart';
import 'package:sephora/values/app_font_stye.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic>? data;
  bool search = false;
  List<dynamic> filteredProducts = [];
  final TextEditingController _searchController = TextEditingController();
  String searchText = '';

  @override
  void initState() {
    super.initState();
    fetchSearchResults('');
  }

  void _searchChanged(String value) {
    setState(() {
      searchText = value;
      _filterProducts();
    });
    fetchSearchResults(value);
  }

  void _filterProducts() {
    if (searchText.isEmpty) {
      setState(() {
        filteredProducts = data?['data']['products'] ?? [];
      });
    } else {
      setState(() {
        filteredProducts = data?['data']['products']
            .where((product) =>
                product['title']
                    .toLowerCase()
                    .contains(searchText.toLowerCase()) ||
                (product['description'] ?? '')
                    .toLowerCase()
                    .contains(searchText.toLowerCase()))
            .toList();
      });
    }
  }

  Future<void> fetchSearchResults(String query) async {
    var servicename =
        'https://bb3-api.ashwinsrivastava.com/store/product/search?q=$query';
    try {
      var response = await http.get(Uri.parse(servicename));

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("Fetched successfully");
        }
        setState(() {
          data = json.decode(response.body);
          filteredProducts = data?['data']['products'] ?? [];
        });
      } else {
        if (kDebugMode) {
          print("Failed to fetch products.");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
    }


  //  
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: search
            ? SizedBox(
                height: 40.0,
                child: TextField(
                  controller: _searchController,
                  onChanged: _searchChanged,
                  decoration: InputDecoration(
                    hintStyle: AppFontStyle.contentstylebold,
                    hintText: 'Search here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              )
            : const Text(
                'Product List',
                style: AppFontStyle.appbartitle,
              ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  search = !search;
                  if (!search) {
                    _searchController.clear();
                    _filterProducts();
                  }
                });
              },
              icon: Icon(search ? Icons.close : Icons.search))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (filteredProducts.isNotEmpty) ...[
              ListView.builder(
                shrinkWrap: true,
                physics:const  NeverScrollableScrollPhysics(),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  final brand = product['brand'];
                  final variant = product['variants'] != null &&
                          product['variants'].isNotEmpty
                      ? product['variants'][0]
                      : null;

                  return ListTile(
                    title: Card(
                      color: Colors.grey[300],
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 120,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  product['thumbnail'] ?? '',
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(product['title'] ?? 'No Title',
                                style: AppFontStyle.titlestylebold),
                          ),
                          const SizedBox(height: 4.0),
                          // Padding(
                          //   padding:
                          //       const EdgeInsets.symmetric(horizontal: 8.0),
                          //   child: Text(
                          //     product['description'] ??
                          //         'No description available',
                          //     style: const TextStyle(
                          //         fontSize: 12, color: Colors.black87),
                          //     maxLines: 7,
                          //     overflow: TextOverflow.ellipsis,
                          //   ),
                          // ),
                          // const SizedBox(height: 4.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                                "₹${variant != null ? variant['price'] : product['priceStart'] ?? 'N/A'}",
                                style: AppFontStyle.contentstylegreenbold),
                          ),
                          const SizedBox(height: 4.0),
                          if (brand != null) ...[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(brand['title'] ?? '',
                                  style: AppFontStyle.titlestylebluebold),
                            ),
                          ],
                          const SizedBox(height: 4.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Rating: ${(product['averageRating'] != null) ? product['averageRating'].toStringAsFixed(2) : 'No Rating'}",
                              style: AppFontStyle.contentstylebluebold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetails(product: product),
                        ),
                      );
                    },
                  );
                },
              ),
            ] else
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'No products found.',
                    style: AppFontStyle.contentstyle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
