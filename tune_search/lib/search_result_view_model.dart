import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tune_search/tune_search.dart';

class SearchResultViewModel extends Model {
  List<CollectionViewModel> _collections;
  List<CollectionViewModel> get collections => _collections;
  set collections(List<CollectionViewModel> value) {
    _collections = value;
    notifyListeners();
  }

    static SearchResultViewModel of(BuildContext context) =>
      ScopedModel.of<SearchResultViewModel>(context);

}