import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twitter_clone_2/core/domain/failure.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState<T> with _$SearchState<T> {
  const SearchState._();
  const factory SearchState.init() = _SearchInit<T>;
  const factory SearchState.data({
    required T data,
  }) = _SearchSuccess<T>;
  const factory SearchState.error({
    required Failure failure,
    required T data,
  }) = _SearchFailure<T>;
  const factory SearchState.empty() = SearchEmpty<T>;
  const factory SearchState.loading() = _SearchLoading<T>;

  T? get currentData => when(
      init: () => null,
      loading: () => null,
      data: (data) => data,
      empty: () => null,
      error: (failure, data) => data);
}
