import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommitText extends StatelessWidget {
  const CommitText({
    Key? key,
    required this.flex,
    required this.text,
  }) : super(key: key);

  final int flex;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            // https://github.com/flutter/flutter/issues/18761#issuecomment-811850377
            text.replaceAll('', '\u{200B}'),
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  // fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
          ),
        ));
  }
}
