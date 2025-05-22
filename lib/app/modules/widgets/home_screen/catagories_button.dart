import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesButton extends StatelessWidget {
  final RxList<Map<String, String>> categories;
  final RxInt selectedCategoryIndex;
  final Function(int) onCategorySelected;

  const CategoriesButton({
    super.key,
    required this.categories,
    required this.selectedCategoryIndex,
    required this.onCategorySelected,
  });
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(categories.length, (idx) {
            final isSelected = selectedCategoryIndex.value == idx;
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: GestureDetector(
                onTap: () => onCategorySelected(idx),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10.5),
                  decoration: BoxDecoration(
                    color:
                        isSelected
                            ? const Color.fromRGBO(121, 42, 255, 0.1)
                            : Color.fromRGBO(240, 240, 240, 1),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Center(
                    child: Text(
                      categories[idx]['name'] as String,
                      style: TextStyle(
                        color:
                            isSelected
                                ? Color.fromRGBO(121, 42, 255, 0.75)
                                : Colors.grey[600],
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
