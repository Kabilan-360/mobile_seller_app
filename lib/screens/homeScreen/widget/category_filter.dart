import 'package:flutter/material.dart';

class CategoryFilter extends StatelessWidget {
  final List<String> brands;
  final RangeValues priceRange;
  final List<String> conditions;
  final String selectedBrand;
  final RangeValues selectedPriceRange;
  final String selectedCondition;
  final ValueChanged<String> onBrandSelected;
  final ValueChanged<RangeValues> onPriceRangeChanged;
  final ValueChanged<String> onConditionSelected;

  CategoryFilter({
    required this.brands,
    required this.priceRange,
    required this.conditions,
    required this.selectedBrand,
    required this.selectedPriceRange,
    required this.selectedCondition,
    required this.onBrandSelected,
    required this.onPriceRangeChanged,
    required this.onConditionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButton<String>(
          value: selectedBrand,
          items: brands.map((brand) {
            return DropdownMenuItem(value: brand, child: Text(brand));
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              onBrandSelected(newValue);
            }
          },
        ),

        RangeSlider(
          values: selectedPriceRange,
          min: priceRange.start,
          max: priceRange.end,
          onChanged: onPriceRangeChanged,
        ),
        Row(
          children: conditions.map((condition) {
            return ChoiceChip(
              label: Text(condition),
              selected: selectedCondition == condition,
              onSelected: (selected) {
                if (selected) {
                  onConditionSelected(condition);
                }
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
