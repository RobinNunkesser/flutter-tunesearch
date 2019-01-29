import 'package:tune_search/tune_search.dart';

abstract class InputBoundary<T> {
  void send({T request,OutputBoundary outputBoundary});
}