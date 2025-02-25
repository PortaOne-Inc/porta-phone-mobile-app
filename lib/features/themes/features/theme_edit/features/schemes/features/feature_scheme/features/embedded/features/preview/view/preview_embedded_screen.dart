import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/preview_embedded_cubit.dart';

class PreviewEmbeddedDataScreen extends StatefulWidget {
  const PreviewEmbeddedDataScreen({
    super.key,
  });

  @override
  _PreviewEmbeddedDataScreenState createState() => _PreviewEmbeddedDataScreenState();
}

class _PreviewEmbeddedDataScreenState extends State<PreviewEmbeddedDataScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocConsumer<PreviewEmbeddedCubit, PreviewEmbeddedState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Preview Embedded Data',
              style: textTheme.titleMedium,
            ),
            centerTitle: true,
            actions: [],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          const JsonEncoder.withIndent('  ').convert(state.embeddedResource.toJson()),
                          style: textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      listener: (BuildContext context, PreviewEmbeddedState state) {},
    );
  }
}
