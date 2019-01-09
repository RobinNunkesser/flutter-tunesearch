import 'output_boundary.dart';
import 'request.dart';

abstract class InputBoundary<T extends Request> {
  send({T request,OutputBoundary outputBoundary});
}