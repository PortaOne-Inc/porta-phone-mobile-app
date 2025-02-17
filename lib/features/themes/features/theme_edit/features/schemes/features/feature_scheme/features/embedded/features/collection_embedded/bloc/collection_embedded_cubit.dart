import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'collection_embedded_state.dart';

part 'collection_embedded_cubit.freezed.dart';

class CollectionEmbeddedCubit extends Cubit<CollectionEmbeddedState> {
  CollectionEmbeddedCubit() : super(const CollectionEmbeddedState.initial());
}
