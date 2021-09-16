import 'package:core_arch_flutter/core_arch_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repos_list_presentation/repos_list_presentation.dart';
import 'package:tile_flutter/tile_flutter.dart';

class ReposListPage extends StatelessWidget {
  const ReposListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Repositories'),
        actions: <Widget>[
          _AppBarPopupMenu(
            onSelected: (_AppBarMenu value) {
              switch (value) {
                case _AppBarMenu.addExistingLocalRepository:
                  context
                      .read<ReposListScreenViewModel>()
                      .onAddExistingLocalRepositoryTap();
                  break;
              }
            },
          ),
        ],
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ReposListScreenViewModel viewModel = context.read();
    return StreamListener<BodyState>(
      stream: viewModel.bodyStateStream,
      builder: (BuildContext context, BodyState data) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: data.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            data: (List<ITileModel> models) {
              final TileFactory factory = context.read();
              return ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    height: 1,
                  );
                },
                itemCount: models.length,
                itemBuilder: (BuildContext context, int index) =>
                    factory.create(context, models[index]),
              );
            },
          ),
        );
      },
    );
  }
}

enum _AppBarMenu { addExistingLocalRepository }

class AppBarPopupMenuItem extends StatelessWidget {
  const AppBarPopupMenuItem({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title),
    );
  }
}

class _AppBarPopupMenu extends StatelessWidget {
  const _AppBarPopupMenu({Key? key, required this.onSelected})
      : super(key: key);

  final PopupMenuItemSelected<_AppBarMenu> onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_AppBarMenu>(
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<_AppBarMenu>>[
        const PopupMenuItem<_AppBarMenu>(
          value: _AppBarMenu.addExistingLocalRepository,
          child: AppBarPopupMenuItem(
            title: 'Add existing local repository',
          ),
        ),
      ],
    );
  }
}
