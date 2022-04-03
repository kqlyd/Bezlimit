import 'package:bezlimit/view/components/appbar_with_circle.dart';
import 'package:bezlimit/view/components/elements_list.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          AppBarWithCircle(),
          ContentListView(),
        ],
      ),
    );
  }
}
