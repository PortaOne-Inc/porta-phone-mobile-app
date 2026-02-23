import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/capabilities_cubit.dart';

class CapabilitiesScreen extends StatefulWidget {
  const CapabilitiesScreen({super.key});

  @override
  State<CapabilitiesScreen> createState() => _CapabilitiesScreenState();
}

class _CapabilitiesScreenState extends State<CapabilitiesScreen> {
  final _searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<CapabilitiesCubit>().load();
    _searchCtrl.addListener(
      () => context.read<CapabilitiesCubit>().updateQuery(_searchCtrl.text),
    );
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CapabilitiesCubit, CapabilitiesState>(
      listener: (context, state) {
        state.maybeWhen(
          failure: (msg) => ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error: $msg'))),
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.when(
          initial: () =>
              const _Shell(body: Center(child: CircularProgressIndicator())),
          loading: () =>
              const _Shell(body: Center(child: CircularProgressIndicator())),
          failure: (msg) => _Shell(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline),
                  const SizedBox(height: 8),
                  Text(msg, textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () => context.read<CapabilitiesCubit>().load(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          ),
          ready: (caps, dirty, query) {
            final filtered = _applyQuery(caps, query);
            return _Shell(
              dirty: dirty,
              onSave: () => context.read<CapabilitiesCubit>().save(),
              header: _Header(controller: _searchCtrl),
              body: RefreshIndicator(
                onRefresh: () => context.read<CapabilitiesCubit>().load(),
                child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 96),
                  itemCount: filtered.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, i) {
                    final c = filtered[i];
                    return Card(
                      child: SwitchListTile(
                        title: Text(c.title),
                        subtitle: Text(
                          c.key,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        value: c.enabled,
                        onChanged: (v) =>
                            context.read<CapabilitiesCubit>().toggle(c.key, v),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }

  List<Capability> _applyQuery(List<Capability> caps, String query) {
    if (query.trim().isEmpty) return caps;
    final q = query.trim().toLowerCase();
    return caps
        .where(
          (c) =>
              c.title.toLowerCase().contains(q) ||
              c.key.toLowerCase().contains(q),
        )
        .toList(growable: false);
  }
}

class _Shell extends StatelessWidget {
  const _Shell({
    required this.body,
    this.header,
    this.dirty = false,
    this.onSave,
  });

  final Widget body;
  final Widget? header;
  final bool dirty;
  final VoidCallback? onSave;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capabilities'),
        bottom: header == null
            ? null
            : PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: header,
                ),
              ),
      ),
      body: body,
      floatingActionButton: dirty
          ? FloatingActionButton.extended(
              onPressed: onSave,
              icon: const Icon(Icons.save),
              label: const Text('Save'),
            )
          : null,
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    decoration: const InputDecoration(
      isDense: true,
      hintText: 'Search capabilities…',
      prefixIcon: Icon(Icons.search),
      border: OutlineInputBorder(),
    ),
  );
}
