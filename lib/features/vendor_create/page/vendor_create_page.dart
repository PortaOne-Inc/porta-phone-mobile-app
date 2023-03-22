import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/core/config/app/application.dart';
import 'package:webtrit_configurator/core/config/l10n/l10n.dart';
import 'package:webtrit_configurator/core/mixin/mixin.dart';
import 'package:webtrit_configurator/core/widgets/widgets.dart';
import 'package:webtrit_configurator/share/share.dart';

import '../bloc/vendor_create_cubit.dart';
import '../model/models.dart';
import '../widgets/vendor_create_toolbar.dart';

class VendorCreatePage extends StatefulWidget {
  const VendorCreatePage({
    super.key,
  });

  @override
  State<VendorCreatePage> createState() => _VendorCreatePageState();
}

class _VendorCreatePageState extends State<VendorCreatePage> with MixinMessages, MixinMessages {
  late final VendorCreateCubit _bloc = BlocProvider.of<VendorCreateCubit>(context);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VendorCreateCubit, VendorCreateState>(
      listener: (BuildContext context, VendorCreateState state) => _listenAppCreateState(state),
      builder: (ctx, state) => Scaffold(
        appBar: BaseToolBar(
          isVisibleProgress: state is VendorCreateStateProgress,
          child: VendorCreateToolbar(
            onSwitchedLanguage: () => _languageChanged(context),
          ),
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800, minWidth: 200),
            child: Card(
              elevation: 2,
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        context.l10n.feature_vendor_create_Text_new_vendor_theme,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        onChanged: _bloc.updateNameChange,
                        decoration: InputDecoration(
                          errorText: state.nameInput?.errorL10n(context),
                          hintText: context.l10n.feature_application_project_name,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        onChanged: _bloc.updateDescriptionChange,
                        decoration: InputDecoration(
                          hintText: context.l10n.feature_application_project_description,
                          errorText: state.descriptionInput?.errorL10n(context),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Divider(
                        color: Colors.black12,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        context.l10n.feature_application_android_package_name,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        onChanged: _bloc.updateAndroidIdentifier,
                        decoration: InputDecoration(
                          errorText: state.applicationAndroidIdentifierInput?.errorL10n(context),
                          prefixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  'com.webtrit.phone.',
                                  style: Theme.of(ctx).textTheme.bodyMedium?.copyWith(
                                        color: Colors.black54,
                                      ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        context.l10n.feature_application_ios_identifier,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        onChanged: _bloc.updateIOSIdentifier,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          errorText: state.applicationIOSIdentifierInput?.errorL10n(context),
                          prefixStyle: Theme.of(ctx).inputDecorationTheme.hintStyle,
                          prefixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  'com.webtrit.phone.',
                                  style: Theme.of(ctx).textTheme.bodyMedium?.copyWith(
                                        color: Colors.black54,
                                      ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        child: Row(
                          children: [
                            Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[50],
                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                              ),
                              child: Center(
                                child: Text(
                                  context.l10n.feature_vendor_create_Text_uuid,
                                  style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.grey),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Container(
                                height: 48,
                                padding: const EdgeInsets.only(left: 16, right: 8, top: 16, bottom: 16),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey[50],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        state.applicationTemplate?.uuid ?? '',
                                        style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.grey),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.copy,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: () => showTopSnakeMessageInfo(
                          context,
                          state.applicationTemplate?.uuid ?? '',
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Button(
                        title: context.l10n.common_feature_create,
                        onPressed: () => _bloc.validateAndTryCreateApplication(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _listenAppCreateState(VendorCreateState state) {
    if (state is VendorCreateStateError) {
      showFailureMessage(context, state.exception.toString());
    }
    if (state is VendorCreateStateSuccess) {
      _openApplications(state.applicationTemplate!);
    }
  }

  void _languageChanged(BuildContext context) {
    showTopSnakeMessageSuccess(context, context.l10n.common_not_implemented);
  }

  void _openApplications(ApplicationModel applicationModel) {
    GoRouter.of(context).pushNamed(AppRoutInfo.vendors.name);
  }
}
