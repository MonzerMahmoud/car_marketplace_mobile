import 'package:car_marketplace_mobile/modules/search/search_action.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:car_marketplace_mobile/modules/search/search_controller.dart'
    as search_controller;

import 'views/custom_dropdown_menu.dart';

class SearchPage extends GetWidget<search_controller.SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CustomDropDownMenu(
                  list: controller.makers,
                  selectedValue: controller.selectedMaker,
                  hintText: 'Select Maker',
                ),
                CustomDropDownMenu(
                  list: controller.models,
                  selectedValue: controller.selectedModel,
                  hintText: 'Select Model',
                ),
                CustomDropDownMenu(
                  list: controller.years,
                  selectedValue: controller.selectedYear,
                  hintText: 'Select Year',
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      SearchAction.searchCar(
                        controller.selectedMaker.value,
                        controller.selectedModel.value,
                        controller.selectedYear.value,
                      );
                    },
                    child: const Text('Search')),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            SearchBodyView(
              controller: controller,
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBodyView extends StatelessWidget {
  SearchBodyView({
    super.key,
    required this.controller,
  });

  search_controller.SearchController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.cars.isNotEmpty,
        child: Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16.0),
            itemBuilder: ((context, index) {
              return Text(
                '${controller.cars[index].make} ${controller.cars[index].model} ${controller.cars[index].year}',
              );
            }),
            itemCount: controller.cars.length,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 8.0),
          ),
        ),
      ),
    );
  }
}
