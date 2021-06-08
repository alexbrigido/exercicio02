

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:exercicio02/app/screens/sprint/sprint_api.dart';
import 'package:exercicio02/app/shared/models/sprint.dart';
import 'package:rxdart/rxdart.dart';

class SprintBloc extends BlocBase {

  final SprintApi _api;
  SprintBloc(this._api);

  late final _sprintFetcher = PublishSubject<List<Sprint>>();

  Stream<List<Sprint>> get sprints => _sprintFetcher.stream;

  getAll() async {
    final sprints = await _api.getSprints();
    _sprintFetcher.sink.add(sprints);
  }

  getById() {

  }

  @override
  void dispose() {
    _sprintFetcher.close();
    super.dispose();
  }
}