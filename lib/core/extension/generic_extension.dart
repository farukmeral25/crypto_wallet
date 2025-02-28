extension GenericExtension<T> on T? {
  bool get isNull => this == null;

  bool get isNotNull => this != null;

  bool isEquals(T? other) {
    return this == other;
  }
}
