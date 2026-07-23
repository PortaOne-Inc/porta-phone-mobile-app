// A generic base class for mapping objects between two types Source and Target.
// It enforces the implementation of `convertTo` and `convertFrom` methods
// unless explicitly left unimplemented.
abstract class CommonMapper<Source, Target> {
  // Converts an object of type Source to type Target.
  // Throws an [UnimplementedError] if not overridden.
  Target convertTo(Source it) {
    throw UnimplementedError('convertTo is not implemented');
  }

  // Converts an object of type Target back to type Source.
  // Throws an [UnimplementedError] if not overridden.
  Source convertFrom(Target it) {
    throw UnimplementedError('convertFrom is not implemented');
  }

  // Converts a list of objects of type Source to a list of objects of type Target.
  List<Target> convertListTo(List<Source> it) {
    return it.map(convertTo).toList();
  }

  // Converts a list of objects of type Target to a list of objects of type Source.
  List<Source> convertListFrom(List<Target> it) {
    return it.map(convertFrom).toList();
  }
}
