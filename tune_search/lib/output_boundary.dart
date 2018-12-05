import 'response.dart';

abstract class OutputBoundary {
  receive({Response response});
}