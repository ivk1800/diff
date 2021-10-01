import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  const TabButton({
    Key? key,
    required this.active,
    required this.text,
    required this.context,
    required this.onPressed,
    required this.onClosePressed,
  }) : super(key: key);

  final bool active;
  final String text;
  final BuildContext context;
  final VoidCallback onPressed;
  final VoidCallback onClosePressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(8.0),
        topLeft: Radius.circular(8.0),
      ),
      child: MaterialButton(
        elevation: 0.0,
        highlightElevation: 0.0,
        hoverElevation: 0.0,
        color: active
            ? Theme.of(context).primaryColor
            : Theme.of(context).highlightColor,
        onPressed: onPressed,
        focusElevation: 0.0,
        child: SizedBox(
          width: 200,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  // https://github.com/flutter/flutter/issues/18761#issuecomment-811850377
                  text.replaceAll('', '\u{200B}'),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color:
                            active ? Theme.of(context).selectedRowColor : null,
                      ),
                ),
              ),
              IconButton(
                iconSize: 20.0,
                onPressed: onClosePressed,
                icon: const Icon(Icons.close),
                color: active ? Colors.white : null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
