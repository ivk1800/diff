import 'package:flutter/material.dart';

import 'tabs_button.dart';

class TabData {
  TabData({required this.text, required this.id});

  final Object id;

  final String text;
}

class TabsPanel extends StatelessWidget {
  const TabsPanel({
    Key? key,
    required this.tabs,
    required this.activeTabId,
    required this.onPressed,
    required this.onClosePressed,
  }) : super(key: key);

  final List<TabData> tabs;
  final Object activeTabId;
  final Function(Object id) onPressed;
  final Function(Object id) onClosePressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: Row(
        children: <Widget>[
          for (int i = 0; i < tabs.length * 2; ++i)
            // todo: repeated 'i ~/ 2'
            if (i.isEven)
              Flexible(
                child: TabButton(
                  active: tabs[i ~/ 2].id == activeTabId,
                  context: context,
                  text: tabs[i ~/ 2].text,
                  onClosePressed: () {
                    onClosePressed.call(tabs[i ~/ 2].id);
                  },
                  onPressed: () {
                    onPressed.call(tabs[i ~/ 2].id);
                  },
                ),
              )
            else if (i ~/ 2 != tabs.length - 1)
              const SizedBox(
                width: 8.0,
              )
        ],
      ),
    );
  }
}
