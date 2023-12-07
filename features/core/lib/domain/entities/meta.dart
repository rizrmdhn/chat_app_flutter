import 'package:equatable/equatable.dart';

class Meta extends Equatable {
  final int status;
  final String message;

  const Meta({
    required this.status,
    required this.message,
  });

  @override
  List<Object?> get props => [status, message];
}
