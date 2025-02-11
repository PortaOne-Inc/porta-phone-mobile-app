import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'publication_resources_state.dart';
part 'publication_resources_cubit.freezed.dart';

class PublicationResourcesCubit extends Cubit<PublicationResourcesState> {
  PublicationResourcesCubit() : super(const PublicationResourcesState.initial());
}
