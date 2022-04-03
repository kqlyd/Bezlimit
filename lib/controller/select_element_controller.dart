import 'package:bezlimit/model/element_model.dart';
import 'package:bezlimit/view/constants/constants.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectElementController extends GetxController {
  late final TextEditingController inputTextController;
  RxInt? selectedIndex;
  late final ScrollController itemScrollController;
  final List<ElementModel> itemList =
      List.generate(10, (index) => ElementModel(index: index, isSelected: false));

  void goToSelectScreen(int index) {
    updateSelectedElement(index);
    Get.toNamed('/element');
  }

  void selectFromTextField() {
    var newIndex = int.tryParse(inputTextController.text);
    if (newIndex == null) {
      Get.showSnackbar(const GetSnackBar(
        title: 'Ошибка',
        message: 'Необходимо ввести число',
        duration: Duration(seconds: 2),
      ));
    } else if (newIndex > itemList.length - 1) {
      Get.showSnackbar(GetSnackBar(
        title: 'Ошибка',
        message: 'Число должно быть меньше ${itemList.length - 1} (включительно)',
        duration: const Duration(seconds: 2),
      ));
    } else {
      updateSelectedElement(newIndex);
      Get.back();
      itemScrollController.animateTo(
        (SizeConstants.elementWidth + SizeConstants.elementPadding) * newIndex,
        duration: const Duration(seconds: 1),
        curve: Curves.ease,
      );
    }
  }

  void updateSelectedElement(int index) {
    if (selectedIndex == null) {
      selectedIndex = RxInt(index);
    } else {
      itemList[selectedIndex!.value].isSelected = false;

      selectedIndex?.value = index;
    }
    itemList[index].isSelected = true;
    inputTextController.text = (index).toString();

    update();
  }

  @override
  void onInit() {
    super.onInit();
    inputTextController = TextEditingController();
    itemScrollController = ScrollController();
  }

  @override
  void onClose() {
    inputTextController.dispose();
    itemScrollController.dispose();
    super.onClose();
  }
}
