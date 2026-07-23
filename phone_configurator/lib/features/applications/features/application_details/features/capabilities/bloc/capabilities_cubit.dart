import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'capabilities_state.dart';

part 'capabilities_cubit.freezed.dart';

class CapabilitiesCubit extends Cubit<CapabilitiesState> {
  CapabilitiesCubit() : super(const CapabilitiesState.initial());

  Future<void> load() async {
    emit(const CapabilitiesState.loading());
    try {
      await Future<void>.delayed(const Duration(milliseconds: 200));
      final data = <Capability>[
        Capability(key: 'favorites', title: 'Favorites', enabled: true),
        Capability(key: 'recents', title: 'Recents', enabled: true),
        Capability(key: 'contacts', title: 'Contacts', enabled: true),
        Capability(key: 'keypad', title: 'Keypad', enabled: true),
        Capability(key: 'messaging', title: 'Messaging', enabled: false),
        Capability(key: 'voicemail', title: 'Voicemail', enabled: false),
        Capability(key: 'embeddedTabs', title: 'Embedded tabs', enabled: false),
        Capability(
          key: 'systemNotifications',
          title: 'System notifications',
          enabled: true,
        ),
      ];
      emit(CapabilitiesState.ready(capabilities: data));
    } catch (e) {
      emit(CapabilitiesState.failure(e.toString()));
    }
  }

  void toggle(String key, bool value) {
    final s = state;
    if (s is _Ready) {
      final updated = s.capabilities
          .map((c) => c.key == key ? c.copyWith(enabled: value) : c)
          .toList(growable: false);
      emit(s.copyWith(capabilities: updated, dirty: true));
    }
  }

  void updateQuery(String query) {
    final s = state;
    if (s is _Ready) emit(s.copyWith(query: query));
  }

  Future<void> save() async {
    final s = state;
    if (s is _Ready) {
      await Future<void>.delayed(const Duration(milliseconds: 200));
      emit(s.copyWith(dirty: false));
    }
  }
}
