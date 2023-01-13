import 'package:bezlimit/view/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppBarWithCircle extends StatelessWidget {
  const AppBarWithCircle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: AppBarWithCircleDelegate(),
    );
  }
}

class AppBarWithCircleDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    double percent = shrinkOffset / (maxExtent - minExtent);
    percent = percent > 1 ? 1 : percent;

    if (percent == 1) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.showSnackbar(
          const GetSnackBar(
            message: 'Appbar полностью скрылся',
            duration: Duration(seconds: 2),
          ),
        );
      });
    }

    //repaint boundary
    return RepaintBoundary(
      child: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: -50,
              top: -50,
              child: Transform.rotate(
                angle: -percent * 3,
                child: SvgPicture.asset(
                  IconPath.circle,
                  height: 300,
                  width: 300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => SizeConstants.appBarheight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}
