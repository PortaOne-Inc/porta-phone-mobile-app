import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:domain/domain.dart';

import '../bloc/update_theme_cubit.dart';

class AssetsProvider {
  const AssetsProvider(this.assets);

  final List<ThemeAssetModel> assets;
}

class AssetsShellRoute extends StatelessWidget {
  const AssetsShellRoute({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<UpdateThemCubit, UpdateThemeState, List<ThemeAssetModel>>(
      selector: (state) => state.assets,
      builder: (context, assets) {
        return Provider<AssetsProvider>(
          key: ValueKey(assets),
          create: (_) => AssetsProvider(assets),
          child: child,
        );
      },
    );
  }
}
