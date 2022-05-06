import 'package:equatable/equatable.dart';
import 'package:test_app/data/activities/models/activities.dart';

abstract class ActivitiesState extends Equatable {
  @override
  List<Object> get props => [];
}

class ActivitiesLoadedState extends ActivitiesState {
  final List<Activities> activities;

  ActivitiesLoadedState({
    required this.activities,
  });
  @override
  List<Object> get props => [activities];
}

class TariffState extends ActivitiesState {
  final List<Tariff> tariffs;
  final DateTime firstAvailableData;
  final DateTime lastAvailableDate;
  final String choosedDate;
  TariffState(
      {required this.tariffs,
      required this.firstAvailableData,
      required this.lastAvailableDate,
      required this.choosedDate});
  @override
  List<Object> get props =>
      [tariffs, firstAvailableData, lastAvailableDate, choosedDate];
}

class LoadingState extends ActivitiesState {}

class InitialState extends ActivitiesState {}

class ErrorState extends ActivitiesState {
  final String error;

  ErrorState({required this.error});
  @override
  List<Object> get props => [error];
}
