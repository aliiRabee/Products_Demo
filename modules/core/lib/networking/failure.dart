import 'package:dependencies/dependencies.dart';

class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

// class Failure extends Equatable {
//   final List<Errors> errors;
//
//   const Failure(this.errors);
//
//   @override
//   List<Object?> get props => [errors];
// }
//
// class Errors extends Equatable {
//   final int code;
//   final String title;
//   final String detail;
//
//   const Errors(this.code, this.title, this.detail);
//
//   @override
//   List<Object?> get props => [code, title, detail];
//
// }
