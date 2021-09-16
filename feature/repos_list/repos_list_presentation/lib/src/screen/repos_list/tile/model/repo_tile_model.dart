import 'package:tile/tile.dart';

class RepoTileModel implements ITileModel {
  const RepoTileModel({
    required this.title,
    required this.path,
  });

  final String path;
  final String title;
}
