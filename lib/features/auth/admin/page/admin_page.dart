import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/core/l10n/l10n.dart';
import 'package:webtrit_configurator/features/auth/admin/bloc/admin_cubit.dart';
import 'package:webtrit_configurator/features/auth/admin/page/color_scheme.dart';
import 'package:webtrit_configurator/features/auth/admin/widget/section_menu.dart';
import 'package:webtrit_configurator/features/theme_edit/widgets/widgets.dart';
import 'package:webtrit_configurator/share/mixin/mixin.dart';
import 'package:webtrit_configurator/share/widgets/widgets.dart';

import '../../theme_edit/widgets/background_binary_resizable_column.dart';
import '../widget/widgets.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({
    super.key,
  });

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> with MixinMessages {
  static const double verticalSpace = 4;

  late final bloc = BlocProvider.of<AdminCubit>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseToolBar(
        child: AdminToolbar(
          onLanguageChanged: () => _languageChanged(context),
        ),
      ),
      body: BackgroundBinaryResizableColumn(
        leftChild: SingleStack(
          child: BlocConsumer<AdminCubit, AdminState>(
            listener: (BuildContext context, AdminState state) => _listenAuthState(context, state),
            builder: (ctx, state) {
              return Container(
                margin: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionMenu(
                      title: 'Default name',
                      onUpdate: () {},
                    ),
                    TextFormField(
                      onChanged: (text) {},
                      initialValue: 'Default name',
                      decoration: InputDecoration(
                        hintText: context.l10n.feature_theme_InputHint_app_name,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SectionMenu(
                      title: 'Default color',
                      onUpdate: () {},
                    ),
                    ColorSchemeWidget(
                      colors: state.colors,
                      updateColor: bloc.updateColor,
                    )
                  ],
                ),
              );
            },
          ),
        ),
        rightChild: Container(),
      ),
    );
  }

  void _languageChanged(BuildContext context) {
    showTopSnakeMessageSuccess(context, context.l10n.common_not_implemented);
  }

  void _listenAuthState(BuildContext context, AdminState state) {
    // if (state is AuthStateError) {
    //   showFailureMessage(context, state.error.toString());
    // }
    // if (state is AuthStateSuccess) {
    //   GoRouter.of(context).goNamed(AppRoutInfo.applicationCollection.name);
    //   showTopSnakeMessageSuccess(context, context.l10n.feature_auth_SnakeBar_success_auth);
    // }
  }

}
