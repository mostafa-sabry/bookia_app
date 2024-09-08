import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeadersHomeWidget extends StatelessWidget {
  const HeadersHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/svgs/logo1.svg",
          width: 99,
        ),
        const Spacer(),
        SvgPicture.asset(
          "assets/svgs/notification.svg",
          width: 24,
        ),
        const SizedBox(
          width: 15,
        ),
        SvgPicture.asset(
          "assets/svgs/search-normal.svg",
          width: 24,
        ),
      ],
    );
  }
}
