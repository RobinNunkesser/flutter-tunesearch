import 'request.dart';

class SearchRequest implements Request {
  final String searchTerm;
  SearchRequest(this.searchTerm);
}
