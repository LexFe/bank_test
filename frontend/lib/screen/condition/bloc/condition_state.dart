part of 'condition_bloc.dart';

class ConditionState extends Equatable {
  final bool isAgree;

  const ConditionState({
    this.isAgree = false,
  });

  ConditionState copyWith({
    bool? isAgree,
  }) {
    return ConditionState(
      isAgree: isAgree ?? this.isAgree,
    );
  }

  @override
  List<Object> get props => [
        isAgree,
      ];
}
