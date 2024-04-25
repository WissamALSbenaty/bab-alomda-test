import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bab_alomda/core/presentation/widgets/custom_sized_box.dart';

class CustomAnimatedList extends StatefulWidget {
  final List<Widget> children;
  final double spacerHeight;
  final ScrollController? scrollController;
  final GlobalKey<AnimatedListState> listKey;

  const CustomAnimatedList({required this.children, required this.listKey, super.key, this.spacerHeight=12, this.scrollController});

  @override
  State<CustomAnimatedList> createState() => CustomAnimatedListState();
}

class CustomAnimatedListState extends State<CustomAnimatedList> {

  List<Widget> toRenderChildren=[];

  @override
  void initState() {
    toRenderChildren.add(CustomSizedBox(height: 12.h,));
    widget.listKey.currentState?.insertItem(0);

    addItems(widget.children);
    super.initState();
  }

  void addItems(final List<Widget> toAddWidgets) {
    var future = Future(() {});
    for (Widget child in toAddWidgets) {
      future = future.then((final _) {
        return Future.delayed(const Duration(milliseconds: 100), () {
          toRenderChildren.add(child);
          toRenderChildren.add(CustomSizedBox(height: widget.spacerHeight,));
          widget.listKey.currentState?.insertItem(toRenderChildren.length - 2);
          widget.listKey.currentState?.insertItem(toRenderChildren.length - 1);
        });
      });
    }
  }

  @override
  void didUpdateWidget(covariant final CustomAnimatedList oldWidget) {
      final int newElementsLength=widget.children.length - (toRenderChildren.length) ~/2;
      if(newElementsLength<=0) {
        return ;
      }

    final List<Widget> newElements=widget.children.sublist(widget.children.length-newElementsLength);
      addItems(newElements);
    super.didUpdateWidget(oldWidget);
  }
  @override
  Widget build(final BuildContext context) {
    return AnimatedList(
      physics: const AlwaysScrollableScrollPhysics(),
        key: widget.listKey,
      padding:  EdgeInsets.symmetric(horizontal: 8.w),
        initialItemCount: toRenderChildren.length,
        controller: widget.scrollController,
        itemBuilder: (final context, final index, final animation) {
          return SlideTransition(
            position: CurvedAnimation(
              curve: Curves.easeOut,
              parent: animation,
            ).drive((Tween<Offset>(
              begin: const Offset(1, 0),
              end:  Offset.zero
            ))),
            child: toRenderChildren[index],
          );
        },
      );
  }
}
