import 'package:tile/tile.dart';

class CommitTileModel implements ITileModel {
  const CommitTileModel({
    required this.id,
    required this.description,
    required this.commit,
    required this.author,
    required this.date,
  });

  final String description;
  final String commit;
  final String author;
  final String date;
  final String id;
}
