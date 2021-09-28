import 'package:commits_list_presentation/commits_list_presentation.dart';
import 'package:flutter/foundation.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:tile_flutter/tile_flutter.dart';

import '../commit_tile_factory_delegate.dart';
import '../commits_table_delegate.dart';
import '../section_data.dart';
import '../table_context.dart';
import 'uncommitted_changes_tile_factory_delegate.dart';

class SimpleCommitsTableDelegate implements ICommitsTableDelegate {
  SimpleCommitsTableDelegate() {
    _tileFactory = TileFactory(
      delegates: <Type, ITileFactoryDelegate<ITileModel>>{
        CommitTileModel: CommitTileFactoryDelegate(
          onSelected: _onCellSelected,
        ),
        UncommittedChangesTileModel: UncommittedChangesTileFactoryDelegate(
          onSelected: _onCellSelected,
        ),
      },
    );
  }

  late TileFactory _tileFactory;

  @override
  void onNewFlexCallback(Section section, int result) {
    switch (section) {
      case Section.graph:
        contextData.value = contextData.value.copy(
          grathColumnFlex: result,
        );
        break;
      case Section.description:
        contextData.value = contextData.value.copy(
          descriptionColumnFlex: result,
        );
        break;
      case Section.commit:
        contextData.value = contextData.value.copy(
          commitColumnFlex: result,
        );
        break;
      case Section.author:
        contextData.value = contextData.value.copy(
          authorColumnFlex: result,
        );
        break;
      case Section.date:
        contextData.value = contextData.value.copy(
          dateColumnFlex: result,
        );
        break;
    }
  }

  @override
  final ValueNotifier<TableContextData> contextData =
      ValueNotifier<TableContextData>(
    TableContextData(
      grathColumnFlex: 20,
      descriptionColumnFlex: 40,
      commitColumnFlex: 10,
      authorColumnFlex: 15,
      dateColumnFlex: 15,
      selectedCells: <int>[],
    ),
  );

  @override
  final ValueNotifier<List<ITileModel>> items = ValueNotifier<List<ITileModel>>(
    const <ITileModel>[],
  );

  @override
  TileFactory get tileFactory => _tileFactory;

  void _onCellSelected(Object cellId) {
    if (!contextData.value.selectedCells.contains(cellId)) {
      contextData.value = contextData.value.copy(
        selectedCells: <Object>[cellId],
      );
    }
  }

  @override
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  final ItemScrollController itemScrollController = ItemScrollController();
}
