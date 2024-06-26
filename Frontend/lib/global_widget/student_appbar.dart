import 'package:flutter/material.dart';
import 'package:placement_app/core/constants/color_constants.dart';

class StudentAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool? centerTitle;
  final TextStyle? titleTextStyle;
  final PreferredSizeWidget? bottom;

  const StudentAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.centerTitle = true,
    this.titleTextStyle,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title!),
      centerTitle: centerTitle,
      backgroundColor: ColorTheme.white,
      leading: leading,
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
