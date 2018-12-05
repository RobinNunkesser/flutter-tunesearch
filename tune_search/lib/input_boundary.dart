import 'output_boundary.dart';
import 'request.dart';

abstract class InputBoundary {
  send({Request request,OutputBoundary outputBoundary});
}