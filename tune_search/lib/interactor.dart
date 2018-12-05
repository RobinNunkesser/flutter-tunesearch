import 'input_boundary.dart';
import 'output_boundary.dart';
import 'tunes_search_gateway.dart';
import 'request.dart';

class Interactor implements InputBoundary {
  @override
  send({Request request, OutputBoundary outputBoundary}) async {
    var response = await TunesSearchGateway().fetchData(request.searchTerm);
    outputBoundary.receive(response: response);
  }
}
