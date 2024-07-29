import 'package:equatable/equatable.dart';

class Health extends Equatable {
  const Health({this.disease, this.cause, this.solution, this.isExpanded = false});

  final String? disease;
  final String? cause;
  final String? solution;
  final bool isExpanded;

  Health copyWith({
    String? disease,
    String? cause,
    String? solution,
    bool? isExpanded,
  }) =>
      Health(
        disease: disease ?? this.disease,
        cause: cause ?? this.cause,
        solution: solution ?? this.solution,
        isExpanded: isExpanded ?? this.isExpanded,
      );

  @override
  List<Object?> get props => [disease, cause, solution, isExpanded];
}
