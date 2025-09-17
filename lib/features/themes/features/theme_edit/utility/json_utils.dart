import '../consts/consts.dart';

/// Creates a shallow copy of the given JSON map.
///
/// Useful for avoiding direct mutation of the original object.
/// This is critical when maintaining immutable state in a theme theme_editor.
///
/// Example:
/// ```dart
/// final newMap = clone(oldMap);
/// newMap['color'] = 'red'; // oldMap is not affected
/// ```
JsonMap clone(JsonMap m) => {...m};

/// Ensures a nested map exists at the given path and returns it.
///
/// - [root] — starting JSON map.
/// - [path] — list of keys representing the nested path.
///
/// If any level is missing or is not a map, a new empty map will be created.
///
/// Example:
/// ```dart
/// final config = <String, dynamic>{};
/// final nested = ensureMapAtPath(config, ['theme', 'colors']);
/// nested['primary'] = '#FF0000';
/// // config == { 'theme': { 'colors': { 'primary': '#FF0000' } } }
/// ```
JsonMap ensureMapAtPath(JsonMap root, List<String> path) {
  var node = root;
  for (final seg in path) {
    final next = node[seg];
    if (next is Map<String, dynamic>) {
      node = next;
    } else {
      final created = <String, dynamic>{};
      node[seg] = created;
      node = created;
    }
  }
  return node;
}

/// Sets or removes a value in a nested map.
///
/// - [root] — starting JSON map.
/// - [path] — path to the nested map containing the target key.
/// - [leafKey] — the key to set or remove.
/// - [value] — the value to set; if `null`, the key will be removed.
///
/// Uses [ensureMapAtPath] to guarantee all path levels exist.
///
/// Example:
/// ```dart
/// final config = <String, dynamic>{};
/// setAt(config, ['theme', 'colors'], 'primary', '#FF0000');
/// // config == { 'theme': { 'colors': { 'primary': '#FF0000' } } }
///
/// setAt(config, ['theme', 'colors'], 'primary', null);
/// // config == { 'theme': { 'colors': {} } }
/// ```
void setAt(JsonMap root, List<String> path, String leafKey, dynamic value) {
  final parent = ensureMapAtPath(root, path);
  if (value == null) {
    parent.remove(leafKey);
  } else {
    parent[leafKey] = value;
  }
}
