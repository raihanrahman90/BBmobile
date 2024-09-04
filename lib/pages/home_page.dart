import 'package:bbmobile/models/items_response.dart';
import 'package:bbmobile/models/pagination.dart';
import 'package:bbmobile/services/api_cart_service.dart';
import 'package:bbmobile/services/api_item_service.dart';
import 'package:bbmobile/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Pagination<Item>? pagination;
  final ApiItemService _apiItemsService = ApiItemService();
  late Future<int> _futureCartCount;

  @override
  void initState() {
    super.initState();
    _fetchItems();
    _futureCartCount = ApiCartService().fetchCartCount();
  }

  Future<void> _fetchItems() async {
    final fetchedPagination = await _apiItemsService.fetchItems();
    setState(() {
      pagination = fetchedPagination;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          FutureBuilder<int>(
            future: _futureCartCount,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
          // Handle error action
                  },
                );
              } else {
                final cartCount = snapshot.data ?? 0;
                return Stack(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () {
                      },
                    ),
                    if (cartCount > 0)
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            '$cartCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                );
              }
            }
          )
        ]
      ),
      body: pagination == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Categories Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CategoryButton(label: 'Wanita'),
                CategoryButton(label: 'Pria'),
                CategoryButton(label: 'Anak-anak'),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Items Section
          Expanded(
            child: ListView.builder(
              itemCount: pagination?.data.length ?? 0,
              itemBuilder: (context, index) {
                final item = pagination!.data[index];
                return ListTile(
                  leading: Image.network(item.image),
                  title: Text(item.name),
                  subtitle: Text('Price: ${item.price}'),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0,
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;

  CategoryButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle category selection
      },
      child: Text(label),
    );
  }
}
