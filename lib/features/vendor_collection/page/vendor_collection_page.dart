import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/core/config/app/application.dart';
import 'package:webtrit_configurator/core/config/l10n/l10n.dart';
import 'package:webtrit_configurator/core/mixin/mixin.dart';
import 'package:webtrit_configurator/core/widgets/widgets.dart';
import 'package:webtrit_configurator/share/entity/entity.dart';

import '../bloc/vendor_collection_cubit.dart';
import '../widgets/widgets.dart';

class VendorCollectionPage extends StatefulWidget {
  const VendorCollectionPage({
    super.key,
  });

  @override
  State<VendorCollectionPage> createState() => _VendorCollectionPageState();
}

class _VendorCollectionPageState extends State<VendorCollectionPage> with MixinMessages {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VendorCollectionCubit, VendorCollectionState>(
      listener: (BuildContext context, VendorCollectionState state) {},
      builder: (ctx, state) {
        return Scaffold(
          appBar: BaseToolBar(
            isVisibleProgress: state is AppsInitial,
            child: VendorsCollectionToolbar(onLogout: () => _onLogout(context)),
          ),
          body: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800, minWidth: 200),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Visibility(
                      visible: state is AppsInitial,
                      child: const CircularProgressIndicator(),
                    ),
                    VendorEmptyView(
                      visibility: state is! AppsInitial && state.apps.isEmpty,
                    ),
                    Visibility(
                      visible: state is! AppsInitial && state.apps.isNotEmpty,
                      child: GridView.builder(
                        padding: const EdgeInsets.only(top: 24),
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (ctx, index) => VendorPreviewItem(
                            application: state.apps[index],
                            onDelete: BlocProvider.of<VendorCollectionCubit>(context).deleteApplication,
                            onEdit: _onEditApplication,
                            onOpen: _openApplication),
                        itemCount: state.apps.length,
                        gridDelegate: _prepareGridDelegate(state.apps),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            width: double.infinity,
                            color: Colors.black,
                            height: 1,
                          ),
                        ),
                        Text(
                          state.apps.isEmpty
                              ? context.l10n.feature_vendor_Text_butWeCan
                              : context.l10n.feature_vendor_Text_or,
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            width: double.infinity,
                            color: Colors.black,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Button(
                      title: context.l10n.feature_vendor_create,
                      onPressed: () => _createApplication(),
                    ),
                    const SizedBox(height: 16)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount _prepareGridDelegate(List<ApplicationModel> apps) {
    var crossAxisCount = 1;
    if (apps.length == 2) crossAxisCount = 2;
    if (apps.length > 2) crossAxisCount = 3;

    return SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: crossAxisCount == 1 ? 3 : 1.5);
  }

  void _onLogout(BuildContext context) {
    showTopSnakeMessageInfo(context, context.l10n.notImplemented);
  }

  void _onEditApplication(ApplicationModel applicationModel) {
    showTopSnakeMessageInfo(context, context.l10n.common_not_implemented);
  }

  void _createApplication() {
    GoRouter.of(context).goNamed(AppRoutInfo.vendorCreate.name);
  }

  void _openApplication(ApplicationModel applicationModel) {
    GoRouter.of(context).pushNamed(
      AppRoutInfo.themes.name,
      params: <String, String>{
        AppRoutInfo.keyVendorId: applicationModel.id!,
      },
    );
  }
}
