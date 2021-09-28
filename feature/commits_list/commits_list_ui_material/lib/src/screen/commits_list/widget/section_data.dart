class SectionData {
  SectionData({
    required this.text,
    required this.section,
    required this.flex,
  });

  final Section section;
  final int flex;
  final String text;
}

enum Section {
  graph,
  description,
  commit,
  author,
  date,
}
