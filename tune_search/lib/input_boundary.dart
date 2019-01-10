import 'output_boundary.dart';

abstract class InputBoundary<T> {
  send({T request,OutputBoundary outputBoundary});
}