import 'package:flutter/material.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_size.dart';

class DefaultSwitchOnboarding extends StatelessWidget {
  final String labelSwitch;
  final IconData iconSwitch;

  const DefaultSwitchOnboarding({
    super.key,
    required this.labelSwitch,
    required this.iconSwitch,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          labelSwitch,
          style: TextStyle(
            fontSize: AppFontSize.titleStyle20,
            color: AppColor.primary,
            fontFamily: 'JockeyOne',
          ),
        ),
        IconButton(
          icon: Icon(iconSwitch, color: AppColor.primary),
          onPressed: () {},
        ),
      ],
    );
  }
}
