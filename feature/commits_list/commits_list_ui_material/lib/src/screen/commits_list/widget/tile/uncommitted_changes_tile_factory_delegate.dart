import 'package:commits_list_presentation/commits_list_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tile_flutter/tile_flutter.dart';

import '../commit_text.dart';
import '../table_context.dart';

class UncommittedChangesTileFactoryDelegate
    implements ITileFactoryDelegate<UncommittedChangesTileModel> {
  const UncommittedChangesTileFactoryDelegate({required this.onSelected});

  final void Function(Object cellId) onSelected;

  @override
  Widget create(BuildContext context, UncommittedChangesTileModel model) {
    final TableContextData data = TableContext.of(context);
    return InkWell(
      onTap: () {
        onSelected.call(model.id);
      },
      canRequestFocus: false,
      child: Container(
        color: data.selectedCells.contains(model.id)
            ? Theme.of(context).highlightColor
            : Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: data.grathColumnFlex,
              child: const SizedBox.shrink(),
            ),
            CommitText(
              flex: 100 - data.grathColumnFlex,
              text: 'Uncommitted changes',
            ),
          ],
        ),
      ),
    );
  }
}
