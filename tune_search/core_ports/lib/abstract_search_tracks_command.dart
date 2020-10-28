import 'package:explicit_architecture/explicit_architecture.dart';
import 'package:core_ports/collection_entity.dart';
import 'package:core_ports/search_tracks_dto.dart';

abstract class AbstractSearchTracksCommand implements Command<SearchTracksDTO, List<CollectionEntity>> {

}