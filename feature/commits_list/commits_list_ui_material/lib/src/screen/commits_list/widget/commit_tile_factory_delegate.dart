import 'package:commits_list_presentation/commits_list_presentation.dart';
import 'package:flutter/widgets.dart';
import 'package:tile_flutter/tile_flutter.dart';

import 'commit_cell.dart';

class CommitTileFactoryDelegate
    implements ITileFactoryDelegate<CommitTileModel> {
  const CommitTileFactoryDelegate({required this.onSelected});

  final void Function(Object commitId) onSelected;

  @override
  Widget create(BuildContext context, CommitTileModel model) {
    return CommitCell(
      model: model,
      onSelected: onSelected,
    );
  }
}
