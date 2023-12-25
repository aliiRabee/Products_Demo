import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_colors.dart';
import 'app_text.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final dynamic title;

  final bool hasBack;
  final bool? centerTitle;
  final bool hasNotifications;
  final bool hasAdd;
  final VoidCallback? onBack;
  final String? fontFamily;
  final VoidCallback? onAddTapped;
  final Widget? leadingWidgets;

  const DefaultAppBar({
    Key? key,
    this.title,
    this.hasBack = true,
    this.centerTitle,
    this.hasAdd = false,
    this.hasNotifications = false,
    this.onBack,
    this.onAddTapped,
    this.leadingWidgets,
    this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleSpacing: hasBack ? 0 : 20,
          automaticallyImplyLeading: false,
          leading: hasBack
              ? InkWell(
                  onTap: onBack ??
                      () {
                        if (Modular.to.canPop()) {
                          Modular.to.pop();
                        } else {}
                      },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.black,
                    size: 20,
                  ))
              : null,
          actions: [
            if (hasAdd)
              InkWell(
                  onTap: onAddTapped,
                  child: Icon(
                    Icons.add,
                    color: AppColors.black,
                  )),
            if (leadingWidgets != null) ...[
              leadingWidgets!,
            ],
            if (hasNotifications)
              InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.notifications_none_outlined,
                    color: AppColors.black,
                  ))
          ],
          centerTitle: centerTitle,
          title: title is String
              ? AppText(
                  title: title!,
                  fontSize: 22,
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                )
              : title is Widget
                  ? title
                  : null),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
