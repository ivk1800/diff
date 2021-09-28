import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:tile/tile.dart';
import 'package:tile_flutter/tile_flutter.dart';

class CommitList extends StatelessWidget {
  const CommitList({
    Key? key,
    required this.items,
    required this.tileFactory,
    required this.itemScrollController,
    required this.itemPositionsListener,
  }) : super(key: key);

  final List<ITileModel> items;
  final TileFactory tileFactory;
  final ItemScrollController itemScrollController;
  final ItemPositionsListener itemPositionsListener;

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.separated(
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(height: 1);
      },
      itemScrollController: itemScrollController,
      itemPositionsListener: itemPositionsListener,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final ITileModel tileModel = items[index];
        return tileFactory.create(context, tileModel);
      },
    );
  }
}
