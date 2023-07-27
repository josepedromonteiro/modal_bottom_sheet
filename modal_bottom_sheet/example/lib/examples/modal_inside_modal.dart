import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ModalInsideModal extends StatelessWidget {
  final bool reverse;

  const ModalInsideModal({Key? key, this.reverse = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        transitionBetweenRoutes: false,
        leading: Container(),
        middle: Text('Modal Page'),
      ),
      child: SafeArea(
        bottom: false,
        child: ListView(
          reverse: reverse,
          // shrinkWrap: true,
          controller: PrimaryScrollController.of(context),
          physics: BouncingScrollPhysics(),
          children: ListTile.divideTiles(
              context: context,
              tiles: List.generate(
                100,
                (index) => ListTile(
                  title: Text('Item $index'),
                  onTap: () => Navigator.of(context).push(
                    CupertinoSheetRoute<void>(
                      builder: (context) => ModalInsideModal(reverse: reverse),
                    ),
                  ),
                ),
              )).toList(),
        ),
      ),
    ));
  }
}
