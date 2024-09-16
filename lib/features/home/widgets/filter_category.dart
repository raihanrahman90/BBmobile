import 'package:auto_route/auto_route.dart';
import 'package:bbmobile/features/home/data/product_query.dart';
import 'package:flutter/material.dart';

class FilterCategory extends StatefulWidget {
  final ProductQuery? filter;
  final Function(ProductQuery) onSearch;

  const FilterCategory({super.key, required this.onSearch, this.filter});

  @override
  State<FilterCategory> createState() => _FilterCategoryState();
}

class _FilterCategoryState extends State<FilterCategory> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              widget.onSearch(
                ProductQuery(
                    category: null
                ),
              );
            },
            icon: const Icon(Icons.people),
          ),IconButton(
            onPressed: () {
              widget.onSearch(
                ProductQuery(
                    category: "WANITA"
                ),
              );
            },
            icon: const Icon(Icons.woman),
          ),
          IconButton(
            onPressed: () {
              widget.onSearch(
                ProductQuery(
                    category: "PRIA"
                ),
              );
            },
            icon: const Icon(Icons.man),
          ),
          IconButton(
            onPressed: () {
              widget.onSearch(
                ProductQuery(
                    category: "ANAK"
                ),
              );
            },
            icon: const Icon(Icons.child_friendly),
          ),
        ],
      )
    );
  }
}
