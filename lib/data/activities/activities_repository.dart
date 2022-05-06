import 'dart:developer';

import 'package:test_app/data/activities/models/activities.dart';
import 'package:test_app/di/di_locator.dart';
import 'package:test_app/services/shymbulak_service.dart';

class ActivitiesRepository {
  final ShymbulakService _apiService;

  ActivitiesRepository() : _apiService = locator();
  Future<List<Activities>> getAllActivities() async {
    final response = await _apiService.getAllActivities();
    final json = response.data;
    return activitiesFromJson(json);
  }
}
