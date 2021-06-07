import 'dart:convert';

import 'package:http/http.dart';
import 'package:exercicio02/app/shared/models/sprint.dart';
import 'package:exercicio02/app/shared/util/constants.dart';

class SprintApi {

  final Client _client;
  SprintApi(this._client);

  Future<List<Sprint>> getSprints() async {
    final response = await _client.get(Uri.parse('${Constants.API_BASE_URL}/sprint'));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final List<dynamic> jPosts = json.decode(response.body);
      final sprints = jPosts.map((jp) => Sprint.fromJson(jp)).toList();
      return sprints;
    }else{
      throw Exception('Erro ao recuperar sprints');
    }
  }

  Future<Sprint> getSprintById(int id) async {
    final response = await _client.get(Uri.parse('${Constants.API_BASE_URL}/sprint/$id'));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final dynamic jSprint = json.decode(response.body);
      final sprint = jSprint.map((jp) => Sprint.fromJson(jp));
      return sprint;
    }else{
      throw Exception('Erro ao recuperar sprint por id');
    }
  }
}