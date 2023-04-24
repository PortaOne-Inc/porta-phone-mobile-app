import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:webtrit_configurator/share/entity/models/theme/color_model.dart';

part 'admin_state.dart';

part 'admin_cubit.freezed.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(AdminState(colors: ColorModel()));

  void loadDefaultTheme() {}

  void updateColor(ColorModel? colorModel) {
    emit(AdminState.update(colors: colorModel));
  }
}
