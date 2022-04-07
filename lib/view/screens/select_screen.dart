import 'package:bezlimit/controller/select_element_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SelectScreen extends StatelessWidget {
  const SelectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SelectTextField(),
                SaveButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.find<SelectElementController>().selectFromTextField();
      },
      child: const Text('Сохранить'),
    );
  }
}

class SelectTextField extends StatelessWidget {
  const SelectTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      controller: Get.find<SelectElementController>().inputTextController,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }
}
