import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    Key? key,
    required this.widthFlex,
    required this.text,
  }) : super(key: key);

  final int widthFlex;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widthFlex,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Text(
          text,
          maxLines: 1,
          style: Theme.of(context).textTheme.caption!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyText1!.color,
              ),
        ),
      ),
    );
  }
}
