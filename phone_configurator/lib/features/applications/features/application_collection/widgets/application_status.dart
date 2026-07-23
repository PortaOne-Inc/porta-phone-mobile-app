// import 'package:flutter/material.dart';
//
// import 'package:webtrit_configurator/localization/localization.dart';
//
// class ApplicationStatus extends StatelessWidget {
//   const ApplicationStatus({
//     required this.countValidationErrors,
//     super.key,
//   });
//
//   final int countValidationErrors;
//
//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     final colorScheme = Theme.of(context).colorScheme;
//
//     return Row(
//       children: [
//         Icon(_getIcon(), color: _getStatusMessageColor(colorScheme)),
//         const SizedBox(width: 4),
//         Expanded(child: _buildStatusMessage(context, textTheme, colorScheme)),
//       ],
//     );
//   }
//
//   Widget _buildStatusMessage(BuildContext context, TextTheme textTheme, ColorScheme colorScheme) {
//     return Text(
//       _getStatusMessage(context),
//       style: textTheme.labelLarge?.copyWith(
//         color: _getStatusMessageColor(colorScheme),
//       ),
//     );
//   }
//
//   IconData _getIcon() {
//     return countValidationErrors == 0 ? Icons.check_box : Icons.indeterminate_check_box_rounded;
//   }
//
//   String _getStatusMessage(BuildContext context) {
//     return countValidationErrors == 0
//         ? context.l10n.feature_application_collection_ApplicationStatus_ready_to_deploy
//         : context.l10n.feature_application_collection_ApplicationStatus_not_resolved_issues(countValidationErrors);
//   }
//
//   Color _getStatusMessageColor(ColorScheme colorScheme) {
//     return countValidationErrors == 0 ? Colors.green : colorScheme.error;
//   }
// }
