import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_state.dart';

part 'common_bloc.freezed.dart';

class CommonBloc extends Cubit<CommonState> {
  CommonBloc() : super(const CommonState.initial());
}
