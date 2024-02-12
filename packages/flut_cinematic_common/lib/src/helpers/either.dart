import 'package:freezed_annotation/freezed_annotation.dart';

part 'either.freezed.dart';

@freezed
sealed class Either<L, R> with _$Either<L, R> {
  const factory Either.left(L value) = Left<L, R>;
  const factory Either.right(R value) = Right<L, R>;
}
