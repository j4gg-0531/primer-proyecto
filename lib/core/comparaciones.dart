/// Igualdad elemento a elemento.
///
/// En Dart, `[1, 2] == [1, 2]` es **false**: las listas se comparan por
/// identidad, no por contenido.
bool listasIguales<T>(List<T> a, List<T> b) {
  if (identical(a, b)) return true;
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}
