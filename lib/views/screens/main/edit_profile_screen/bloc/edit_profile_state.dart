part of 'edit_profile_cubit.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    ResponseItem? responseItem,
    @Default('') String message,
    File? file,
    @Default('') String name,
    @Default('') String email,
    @Default('') String profilePictureImg,
    @Default(false) bool isForceLogout,
  }) = _EditProfileState;
}
