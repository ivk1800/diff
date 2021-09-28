import 'package:flutter/widgets.dart';

import 'draggable_divider.dart';
import 'header_section.dart';
import 'section_data.dart';
import 'table_context.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.sections,
    required this.onNewFlexCallback,
  }) : super(key: key);

  final List<SectionData> sections;
  final Function(Section section, int result) onNewFlexCallback;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final TableContextData tableContext = TableContext.of(context);

        return SizedBox(
          height: 24,
          child: Row(
            children: sections
                .map((SectionData sectionData) => <Widget>[
                      HeaderSection(
                        widthFlex: sectionData.flex,
                        text: sectionData.text,
                      ),
                      DraggableDivider(
                        onPointerMove: (PointerMoveEvent event) {
                          _handleDragSectionDivider(
                            sectionData: sectionData,
                            tableContext: tableContext,
                            maxWidth: constraints.maxWidth,
                            dx: event.position.dx,
                          );
                        },
                        isDraggableDivider: true,
                      ),
                    ])
                .reduce((List<Widget> value, List<Widget> element) =>
                    value + element),
          ),
        );
      },
    );
  }

  void _handleDragSectionDivider({
    required SectionData sectionData,
    required TableContextData tableContext,
    required double maxWidth,
    required double dx,
  }) {
    final SectionData rightSection =
        sections[sections.indexOf(sectionData) + 1];
    _calculate(
      maxWidth: maxWidth,
      dx: dx,
      leftOtherSectionsFlex: sections
          .takeWhile(
              (SectionData value) => value.section != sectionData.section)
          .fold(
              0,
              (int previousValue, SectionData element) =>
                  previousValue + element.flex),
      leftSectionFlexResult: (int result) {
        onNewFlexCallback.call(sectionData.section, result);
      },
      rightSectionFlexResult: (int result) {
        onNewFlexCallback.call(rightSection.section, result);
      },
      leftSectionFlex: sectionData.flex,
      rightSectionFlex: rightSection.flex,
    );
  }

  void _calculate({
    required double maxWidth,
    required double dx,
    required int leftOtherSectionsFlex,
    required Function(int result) leftSectionFlexResult,
    required Function(int result) rightSectionFlexResult,
    required int leftSectionFlex,
    required int rightSectionFlex,
  }) {
    final double percent = (dx * 100 / maxWidth) - leftOtherSectionsFlex;
    final int newLeftFlex = percent.round();
    rightSectionFlexResult(leftSectionFlex + rightSectionFlex - newLeftFlex);
    leftSectionFlexResult(newLeftFlex);
  }
}
