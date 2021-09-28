import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tile/tile.dart';

import 'commit_list.dart';
import 'commits_table_delegate.dart';
import 'header.dart';
import 'section_data.dart';
import 'table_context.dart';

class CommitsTable extends StatelessWidget {
  const CommitsTable({
    Key? key,
    required this.delegate,
  }) : super(key: key);

  final ICommitsTableDelegate delegate;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TableContextData>(
      valueListenable: delegate.contextData,
      builder: (
        BuildContext context,
        TableContextData value,
        Widget? child,
      ) {
        return TableContext(
          data: value,
          child: Column(
            children: <Widget>[
              _Header(
                tableContext: value,
                onNewFlexCallback: delegate.onNewFlexCallback,
              ),
              const Divider(height: 1),
              Expanded(
                child: ValueListenableBuilder<List<ITileModel>>(
                    valueListenable: delegate.items,
                    builder: (
                      BuildContext context,
                      List<ITileModel> value,
                      Widget? child,
                    ) {
                      return CommitList(
                        itemPositionsListener: delegate.itemPositionsListener,
                        itemScrollController: delegate.itemScrollController,
                        tileFactory: delegate.tileFactory,
                        items: value,
                      );
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
    required this.tableContext,
    required this.onNewFlexCallback,
  }) : super(key: key);

  final TableContextData tableContext;
  final Function(Section section, int result) onNewFlexCallback;

  @override
  Widget build(BuildContext context) {
    return Header(
      sections: <SectionData>[
        SectionData(
          text: 'Graph',
          section: Section.graph,
          flex: tableContext.grathColumnFlex,
        ),
        SectionData(
            text: 'Description',
            section: Section.description,
            flex: tableContext.descriptionColumnFlex),
        SectionData(
          text: 'Commit',
          section: Section.commit,
          flex: tableContext.commitColumnFlex,
        ),
        SectionData(
          text: 'Author',
          section: Section.author,
          flex: tableContext.authorColumnFlex,
        ),
        SectionData(
          text: 'Date',
          section: Section.date,
          flex: tableContext.dateColumnFlex,
        ),
      ],
      onNewFlexCallback: onNewFlexCallback,
    );
  }
}
