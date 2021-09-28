import 'package:flutter/foundation.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:tile/tile.dart';
import 'package:tile_flutter/tile_flutter.dart';

import 'section_data.dart';
import 'table_context.dart';

abstract class ICommitsTableDelegate {
  const ICommitsTableDelegate();

  ValueListenable<TableContextData> get contextData;

  ValueListenable<List<ITileModel>> get items;

  TileFactory get tileFactory;

  ItemScrollController get itemScrollController;

  ItemPositionsListener get itemPositionsListener;

  void onNewFlexCallback(Section section, int result);
}
