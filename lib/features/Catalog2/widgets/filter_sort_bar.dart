import 'package:flutter/material.dart';

class FilterSortBar extends StatelessWidget {
  const FilterSortBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey[300]!),
          bottom: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.tune, size: 20),
            label: const Text('Filters'),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.secondary,
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.import_export, size: 20),
            label: const Text('Price: lowest to high'),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.secondary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.grid_view),
            color: Theme.of(context).colorScheme.secondary,
          ),
        ],
      ),
    );
  }
}
