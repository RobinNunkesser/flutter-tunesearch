abstract class OutputBoundary<T> {
  void receive({Future<T> response});
}