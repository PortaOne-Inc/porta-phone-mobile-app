class ObjectDescriptor<T, D> {
  ObjectDescriptor({
    required this.style,
    required this.title,
    this.data,
    this.callback,
  });

  final T? style;
  final D? data;
  final void Function(D?)? callback;
  final String title;

  static ObjectDescriptor<T, D>? create<T, D>({
    required T? style,
    required String title,
    D? data,
    void Function(D?)? callback,
  }) {
    if (style == null) return null;
    return ObjectDescriptor<T, D>(
      style: style,
      data: data,
      callback: callback,
      title: title,
    );
  }
}
