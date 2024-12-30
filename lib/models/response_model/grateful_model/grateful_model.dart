import 'package:freezed_annotation/freezed_annotation.dart';

part 'grateful_model.freezed.dart';
part 'grateful_model.g.dart';

@freezed
class GratefulModel with _$GratefulModel {
  const factory GratefulModel({
    @JsonKey(name: 'grateful_id') @Default(0) int gratefulId,
    @JsonKey(name: 'user_token') @Default('') String userToken,
    @JsonKey(name: 'grateful_date') @Default('') String gratefulDate,
    @JsonKey(name: 'grateful_title') @Default('') String gratefulTitle,
    @JsonKey(name: 'grateful_img') @Default('') String gratefulImg,
  }) = _GratefulModel;

  factory GratefulModel.fromJson(Map<String, Object?> json) =>
      _$GratefulModelFromJson(json);
}
