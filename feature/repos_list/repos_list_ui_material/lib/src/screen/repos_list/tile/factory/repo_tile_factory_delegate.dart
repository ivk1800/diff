import 'package:core_ui_material/core_ui_material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:repos_list_presentation/repos_list_presentation.dart';
import 'package:tile_flutter/tile_flutter.dart';

abstract class IRepoTileListener {
  void onRepoRemoveTap(String path);

  void onRepoTap(String path);
}

class RepoTileFactoryDelegate implements ITileFactoryDelegate<RepoTileModel> {
  const RepoTileFactoryDelegate({
    required IRepoTileListener listener,
  }) : _listener = listener;

  final IRepoTileListener _listener;

  @override
  Widget create(BuildContext context, RepoTileModel model) {
    return Listener(
      onPointerDown: (PointerDownEvent event) {
        showContextMenu<ReposContextMenuItem>(
          context: context,
          event: event,
          items: <PopupMenuEntry<ReposContextMenuItem>>[
            const PopupMenuItem<ReposContextMenuItem>(
              child: Text('Remove'),
              value: ReposContextMenuItem.remove,
            ),
          ],
          itemTap: (ReposContextMenuItem item) {
            // Check if menu item clicked
            switch (item) {
              case ReposContextMenuItem.remove:
                _listener.onRepoRemoveTap(model.path);
                break;
            }
          },
        );
      },
      child: ListTile(
        onTap: () {},
        leading: const CircleAvatar(
          child: Icon(Icons.code),
        ),
        title: Text(model.title),
        subtitle: Text(
          model.path,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

enum ReposContextMenuItem {
  remove,
}
