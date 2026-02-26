import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum _ShareState { initial, loading, success, error }

class ShareThemeDialog extends StatefulWidget {
  const ShareThemeDialog({
    required this.themeName,
    required this.onGenerateLink,
    super.key,
  });

  final String themeName;
  final Future<String> Function({String? tag}) onGenerateLink;

  static Future<void> show(
    BuildContext context, {
    required String themeName,
    required Future<String> Function({String? tag}) onGenerateLink,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => ShareThemeDialog(
        themeName: themeName,
        onGenerateLink: onGenerateLink,
      ),
    );
  }

  @override
  State<ShareThemeDialog> createState() => _ShareThemeDialogState();
}

class _ShareThemeDialogState extends State<ShareThemeDialog> {
  _ShareState _state = _ShareState.initial;
  String? _shareUrl;
  String? _errorMessage;
  bool _copied = false;
  final _tagController = TextEditingController();

  @override
  void dispose() {
    _tagController.dispose();
    super.dispose();
  }

  Future<void> _generate() async {
    setState(() {
      _state = _ShareState.loading;
      _errorMessage = null;
    });

    try {
      final tag = _tagController.text.trim();
      final token = await widget.onGenerateLink(
        tag: tag.isEmpty ? null : tag,
      );
      final origin = Uri.base.origin;
      if (!mounted) return;
      setState(() {
        _shareUrl = '$origin/share/$token';
        _state = _ShareState.success;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessage = e.toString();
        _state = _ShareState.error;
      });
    }
  }

  Future<void> _copyToClipboard() async {
    if (_shareUrl == null) return;
    await Clipboard.setData(ClipboardData(text: _shareUrl!));
    if (!mounted) return;
    setState(() => _copied = true);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Text('Share "${widget.themeName}"'),
      content: SizedBox(
        width: 420,
        child: AnimatedSize(
          duration: const Duration(milliseconds: 200),
          child: switch (_state) {
            _ShareState.initial => Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Generate a read-only preview link for this theme.',
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _tagController,
                    maxLength: 100,
                    decoration: const InputDecoration(
                      labelText: 'Tag (optional)',
                      hintText: 'e.g. v1.0, client-review',
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                  ),
                ],
              ),
            _ShareState.loading => const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Generating share link...'),
                  ],
                ),
              ),
            _ShareState.error => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.error_outline,
                      size: 48, color: theme.colorScheme.error),
                  const SizedBox(height: 12),
                  Text(
                    'Failed to generate share link',
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _errorMessage ?? 'Unknown error',
                    style: theme.textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            _ShareState.success => Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Anyone with this link can view a read-only preview of the theme.',
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          readOnly: true,
                          controller: TextEditingController(text: _shareUrl),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                          ),
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton.filled(
                        onPressed: _copyToClipboard,
                        icon: Icon(_copied ? Icons.check : Icons.copy),
                        tooltip: _copied ? 'Copied!' : 'Copy link',
                      ),
                    ],
                  ),
                  if (_copied)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        'Link copied to clipboard!',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                ],
              ),
          },
        ),
      ),
      actions: [
        if (_state == _ShareState.initial)
          FilledButton(
            onPressed: _generate,
            child: const Text('Generate Link'),
          ),
        if (_state == _ShareState.error)
          TextButton(
            onPressed: _generate,
            child: const Text('Retry'),
          ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(_state == _ShareState.success ? 'Done' : 'Cancel'),
        ),
      ],
    );
  }
}
