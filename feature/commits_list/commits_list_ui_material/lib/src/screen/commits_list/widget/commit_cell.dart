import 'package:commits_list_presentation/commits_list_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'commit_text.dart';
import 'table_context.dart';

class CommitCell extends StatelessWidget {
  const CommitCell({
    Key? key,
    required this.model,
    required this.onSelected,
  }) : super(key: key);

  final CommitTileModel model;
  final void Function(Object commitId) onSelected;

  @override
  Widget build(BuildContext context) {
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
            CommitText(
              flex: data.grathColumnFlex,
              text: 'graph',
            ),
            CommitText(
              flex: data.descriptionColumnFlex,
              text: model.description,
            ),
            CommitText(
              flex: data.commitColumnFlex,
              text: model.commit,
            ),
            CommitText(
              flex: data.authorColumnFlex,
              text: model.author,
            ),
            CommitText(
              flex: data.dateColumnFlex,
              text: model.date,
            ),
          ],
        ),
      ),
    );
  }
}
