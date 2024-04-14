import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserSvg extends StatelessWidget {
  const UserSvg({super.key});
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icones/userIcon.svg',
      semanticsLabel: 'User Icon',
    );
  }
}

class UserSideMenu extends StatelessWidget {
  const UserSideMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 100, child: UserSvg());
  }
}
