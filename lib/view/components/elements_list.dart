import 'package:bezlimit/controller/select_element_controller.dart';
import 'package:bezlimit/model/element_model.dart';
import 'package:bezlimit/view/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentListView extends StatelessWidget {
  const ContentListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            WhiteContainer(width: 300),
            WhiteContainer(width: 250),
            WhiteContainer(width: 330),
            ElementList(),
          ],
        ),
      ),
    );
  }
}

class ElementList extends StatelessWidget {
  const ElementList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectElementController>(
      init: SelectElementController(),
      builder: (controller) {
        return SizedBox(
          height: 100,
          child: ListView.builder(
            controller: controller.itemScrollController,
            itemCount: controller.itemList.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var item = controller.itemList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: SizeConstants.elementPadding / 2),
                child: ElementContainer(
                  item: item,
                  onTap: () {
                    controller.goToSelectScreen(index);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class ElementContainer extends StatelessWidget {
  const ElementContainer({
    Key? key,
    required this.item,
    required this.onTap,
  }) : super(key: key);

  final ElementModel item;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          onTap();
        },
        child: Ink(
          width: SizeConstants.elementWidth,
          decoration: BoxDecoration(
            color: item.isSelected ? Colors.orange : Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

class WhiteContainer extends StatelessWidget {
  const WhiteContainer({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Container(
        height: 40,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
