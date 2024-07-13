part of 'condition_bloc.dart';

sealed class ConditionEvent extends Equatable {
  const ConditionEvent();

  @override
  List<Object> get props => [];
}

class ConditionAgreeChanged extends ConditionEvent {
  final bool isAgree;
  const ConditionAgreeChanged({required this.isAgree});
  @override
  List<Object> get props => [isAgree];
}
