import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_notification_setting_data.g.dart';

@JsonSerializable()
class SetNotificationSettingData {
  @JsonKey(name: 'is_motivations_notification')
  int isMotivationsNotification;
  @JsonKey(name: 'motivations_notification_time')
  String motivationsNotificationTime;
  @JsonKey(name: 'is_affirmation_notification')
  int isAffirmationNotification;
  @JsonKey(name: 'affirmation_notification_time')
  String affirmationNotificationTime;

  SetNotificationSettingData(
    this.isMotivationsNotification,
    this.motivationsNotificationTime,
    this.isAffirmationNotification,
    this.affirmationNotificationTime,
  );

  factory SetNotificationSettingData.fromJson(Map<String, dynamic> json) =>
      _$SetNotificationSettingDataFromJson(json);

  Map<String, dynamic> toJson() => _$SetNotificationSettingDataToJson(this);
}
