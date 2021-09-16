import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Future<void> showContextMenu<T>({
  required List<PopupMenuEntry<T>> items,
  required BuildContext context,
  required PointerDownEvent event,
  required Function(T item) itemTap,
}) async {
  if (event.kind == PointerDeviceKind.mouse &&
      event.buttons == kSecondaryMouseButton) {
    final RenderBox overlay =
        Overlay.of(context)!.context.findRenderObject() as RenderBox;
    final T? menuItem = await showMenu<T>(
      context: context,
      items: items,
      position: RelativeRect.fromSize(event.position & Size.zero, overlay.size),
    );
    if (menuItem != null) {
      itemTap.call(menuItem);
    }
  }
}
