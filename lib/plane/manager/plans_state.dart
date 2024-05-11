part of 'plans_cubit.dart';

@immutable
sealed class PlansState {}

final class PlansInitial extends PlansState {}

final class GetPlansLoading extends PlansState {}

final class GetPlansSuccessfully extends PlansState {}
