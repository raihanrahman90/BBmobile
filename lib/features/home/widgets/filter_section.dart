import 'package:auto_route/auto_route.dart';
import 'package:bbmobile/features/home/data/product_query.dart';
import 'package:flutter/material.dart';

class FilterSection extends StatefulWidget {
  final ProductQuery? filter;
  final Function(ProductQuery) onSearch;

  const FilterSection({super.key, required this.onSearch, this.filter});

  @override
  State<FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends State<FilterSection> {
  final _query = TextEditingController();
  final _min = TextEditingController();
  final _max = TextEditingController();
  String _category = '';

  @override
  void initState() {
    super.initState();

    final filter = widget.filter;
    if (filter != null) {
      _query.text = filter.name ?? '';
      _min.text = filter.minPrice != null ? filter.minPrice.toString() : '';
      _max.text = filter.maxPrice != null ? filter.maxPrice.toString() : '';
      _category = filter.category != null ? filter.category.toString() : '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Filter Produk',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 26),
          TextFormField(
            controller: _query,
            decoration: const InputDecoration(
              labelText: 'Cari Barang',
              border: OutlineInputBorder(),
              labelStyle: TextStyle(fontSize: 13),
              suffixIcon: Icon(Icons.search_rounded),
            ),
            textInputAction: TextInputAction.search,
            onFieldSubmitted: (value) {
              widget.onSearch(
                ProductQuery(
                  name: _query.text.trim(),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _min,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Harga Minimal',
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(fontSize: 13),
                  ),
                  textInputAction: TextInputAction.next,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: _max,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Harga Maksimum',
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(fontSize: 13),
                  ),
                  textInputAction: TextInputAction.next,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              widget.onSearch(
                ProductQuery(
                  name: _query.text.trim(),
                  maxPrice: _max.text.isNotEmpty ? int.parse(_max.text) : null,
                  minPrice: _min.text.isNotEmpty ? int.parse(_min.text) : null,
                  category: _category
                ),
              );
              context.router.maybePop();
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Lakukan Pencarian'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
