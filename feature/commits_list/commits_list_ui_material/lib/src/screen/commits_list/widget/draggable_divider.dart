import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DraggableDivider extends StatelessWidget {
  const DraggableDivider({
    Key? key,
    required this.isDraggableDivider,
    required this.onPointerMove,
  }) : super(key: key);

  final bool isDraggableDivider;
  final PointerMoveEventListener onPointerMove;

  @override
  Widget build(BuildContext context) {
    final Container divider = Container(
      color: Colors.transparent,
      constraints: const BoxConstraints.expand(width: 3),
      child: const VerticalDivider(),
    );
    if (isDraggableDivider) {
      return MouseRegion(
        cursor: SystemMouseCursors.resizeColumn,
        child: Listener(
          onPointerMove: onPointerMove,
          child: divider,
        ),
      );
    }
    return divider;
  }
}
