import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/data/activities/models/activities.dart';
import 'package:test_app/utils/date_formatter.dart';
import 'package:test_app/di/di_locator.dart';
import 'package:test_app/domain/activities/activities_use_case.dart';
import 'package:test_app/screens/home/cubit/activity_state.dart';

class ActivitiesCubit extends Cubit<ActivitiesState> {
  ActivitiesCubit()
      : _getActivitiesUseCase = locator(),
        super(InitialState());

  GetActivitiesUseCase _getActivitiesUseCase;

  late DateTime _firstAvailableDate;
  late DateTime _lastAvailableDate;
  String _choosedDate = '';

  late List<Tariff> _currentTariffs;

  late List<Activities> _activities;
  Future<void> getAllActivities() async {
    try {
      emit(LoadingState());
      final _res = await _getActivitiesUseCase.call();
      _activities = _res;

      emit(ActivitiesLoadedState(
        activities: _res,
      ));
    } catch (ex) {
      emit(ErrorState(error: ex.toString()));
    }
  }

  void setTraffics(int index) {
    _firstAvailableDate = _activities[index].availableDates[0];
    _lastAvailableDate = _activities[index]
        .availableDates[_activities[index].availableDates.length - 1];
    _currentTariffs = _activities[index].tariffs;
    emit(TariffState(
        tariffs: _currentTariffs,
        firstAvailableData: _firstAvailableDate,
        lastAvailableDate: _lastAvailableDate,
        choosedDate: _choosedDate));
  }

  void setActivities() {
    emit(ActivitiesLoadedState(activities: _activities));
  }

  void setChoosedDate(DateTime date) async {
    _choosedDate = await formatDate(date);
    emit(TariffState(
        tariffs: _currentTariffs,
        firstAvailableData: _firstAvailableDate,
        lastAvailableDate: _lastAvailableDate,
        choosedDate: _choosedDate));
  }

  void setClear() {
    _currentTariffs = [];
    _choosedDate = ''; 
  }
}
