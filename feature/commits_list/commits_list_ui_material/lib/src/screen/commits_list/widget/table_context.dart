import 'package:flutter/widgets.dart';

class TableContextData {
  TableContextData({
    required this.grathColumnFlex,
    required this.descriptionColumnFlex,
    required this.commitColumnFlex,
    required this.authorColumnFlex,
    required this.dateColumnFlex,
    required this.selectedCells,
  });

  final int grathColumnFlex;
  final int descriptionColumnFlex;
  final int commitColumnFlex;
  final int authorColumnFlex;
  final int dateColumnFlex;
  final List<Object> selectedCells;
}

extension TableContextDataExtension on TableContextData {
  TableContextData copy({
    int? grathColumnFlex,
    int? descriptionColumnFlex,
    int? commitColumnFlex,
    int? authorColumnFlex,
    int? dateColumnFlex,
    List<Object>? selectedCells,
  }) =>
      TableContextData(
        grathColumnFlex: grathColumnFlex ?? this.grathColumnFlex,
        descriptionColumnFlex:
            descriptionColumnFlex ?? this.descriptionColumnFlex,
        commitColumnFlex: commitColumnFlex ?? this.commitColumnFlex,
        authorColumnFlex: authorColumnFlex ?? this.authorColumnFlex,
        dateColumnFlex: dateColumnFlex ?? this.dateColumnFlex,
        selectedCells: selectedCells ?? this.selectedCells,
      );
}

class TableContext extends StatelessWidget {
  const TableContext({Key? key, required this.data, required this.child})
      : super(key: key);

  final TableContextData data;

  final Widget child;

  static TableContextData of(BuildContext context) {
    final _InheritedContext? inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<_InheritedContext>();
    final TableContextData theme = inheritedTheme!.theme.data;
    return theme;
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedContext(
      theme: this,
      child: child,
    );
  }
}

class _InheritedContext extends InheritedTheme {
  const _InheritedContext({
    Key? key,
    required this.theme,
    required Widget child,
  }) : super(key: key, child: child);

  final TableContext theme;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return TableContext(data: theme.data, child: child);
  }

  @override
  bool updateShouldNotify(_InheritedContext old) =>
      theme.data != old.theme.data;
}
