import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bab_alomda/core/presentation/router/auto_router.dart';

class CloseWidget extends StatelessWidget {

  final double height;
  final void Function()? onPressed;

  const CloseWidget({super.key, this.height=24,  this.onPressed});

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
        onTap: onPressed?? ()=>appRouter.maybePop(),
        child: Icon(
          Icons.close,
          size: height.r,)
    );
  }
}
