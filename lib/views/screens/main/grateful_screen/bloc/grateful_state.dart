part of 'grateful_cubit.dart';

@freezed
class GratefulState with _$GratefulState {
  const factory GratefulState({
    ResponseItem? responseItem,
    @Default('') String message,
    @Default(1) int page,
    @Default(false) bool isPaginationLoader,
    File? file,
    @Default('') String date,
    @Default([]) List<GratefulModel> gratefulModelList,
    @Default('') String addGratefulText,
    @Default('') String gratefulImage,
    @Default(false) bool isForceLogout,
  }) = _GratefulState;
}
