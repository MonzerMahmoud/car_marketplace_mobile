
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDownMenu extends StatelessWidget {
  CustomDropDownMenu({
    super.key,
    required this.list,
    required this.selectedValue,
    required this.hintText,
  });

  RxList list;
  RxString selectedValue;
  String hintText;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownMenu(
        hintText: hintText,
        dropdownMenuEntries: list.map(
          (element) {
            return DropdownMenuEntry(value: element, label: element);
          },
        ).toList(),
        onSelected: (value) {
          selectedValue.value = value ?? '';
        },
      ),
    );
  }
}
