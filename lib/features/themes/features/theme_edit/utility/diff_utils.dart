import '../consts/consts.dart';

/// Creates a shallow copy of the provided [JsonMap].
///
/// This is useful when you need to modify a map without mutating the
/// original reference — for example, when following immutable state
/// management patterns.
///
/// Example:
/// ```dart
/// final original = {'color': 'red'};
/// final copy = clone(original);
/// copy['color'] = 'blue';
/// // original stays unchanged
/// ```
JsonMap clone(JsonMap m) => {...m};

/// Ensures that a nested map exists at the given [path] within the [root] map.
///
/// If any part of the path is missing or is not a `Map<String, dynamic>`,
/// it will be replaced with a new empty map. The method then returns
/// the innermost map found or created.
///
/// This is useful for safely navigating or creating deep structures
/// without manually checking and initializing each level.
///
/// Example:
/// ```dart
/// final root = <String, dynamic>{};
/// final colorsMap = ensureMapAtPath(root, ['theme', 'colors']);
/// colorsMap['primary'] = '#FF0000';
/// // root == { 'theme': { 'colors': { 'primary': '#FF0000' } } }
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

/// Sets or removes a value inside a nested map at the given [path] and [leafKey].
///
/// If [value] is not `null`, it will be set at the location.
/// If [value] is `null`, the key will be removed from its parent map.
///
/// Internally uses [ensureMapAtPath] to guarantee the path exists.
///
/// Example:
/// ```dart
/// final root = <String, dynamic>{};
///
/// // Set a value
/// setAt(root, ['theme', 'colors'], 'primary', '#FF0000');
/// // root == { 'theme': { 'colors': { 'primary': '#FF0000' } } }
///
/// // Remove a value
/// setAt(root, ['theme', 'colors'], 'primary', null);
/// // root == { 'theme': { 'colors': {} } }
/// ```
void setAt(JsonMap root, List<String> path, String leafKey, dynamic value) {
  final parent = ensureMapAtPath(root, path);
  if (value == null) {
    parent.remove(leafKey);
  } else {
    parent[leafKey] = value;
  }
}
