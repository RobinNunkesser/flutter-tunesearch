import 'package:core_ports/abstract_search_tracks_command.dart';
import 'package:core_ports/collection_entity.dart';
import 'package:core_ports/search_tracks_dto.dart';

class SearchTracksCommand implements AbstractSearchTracksCommand {
  @override
  Future<List<CollectionEntity>> execute({SearchTracksDTO inDTO}) {
    // TODO: implement execute
    throw UnimplementedError();
  }


}