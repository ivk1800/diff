import 'package:repos_list_presentation/repos_list_presentation.dart';
import 'package:repos_list_ui_material/repos_list_ui_material.dart';

class TileListener implements IRepoTileListener {
  const TileListener({
    required ReposListScreenViewModel viewModel,
  }) : _viewModel = viewModel;

  final ReposListScreenViewModel _viewModel;

  @override
  void onRepoRemoveTap(String path) => _viewModel.onRepoRemoveTap(path);

  @override
  void onRepoTap(String path) => _viewModel.onRepoTap(path);
}
