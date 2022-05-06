import 'dart:developer';

import 'package:test_app/data/activities/activities_repository.dart';
import 'package:test_app/data/activities/models/activities.dart';
import 'package:test_app/di/di_locator.dart';

class GetActivitiesUseCase {
  GetActivitiesUseCase() : _activitiesRepository = locator();

  final ActivitiesRepository _activitiesRepository;
  Future<List<Activities>> call() async {
    final _result = await _activitiesRepository.getAllActivities();
    inspect(_result);

    return _result;
  }
}
