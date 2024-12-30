import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    @JsonKey(name: 'notification_id') @Default(0) int notificationId,
    @JsonKey(name: 'sender_token') @Default('') String senderToken,
    @JsonKey(name: 'receiver_token') @Default('') String receiverToken,
    @JsonKey(name: 'type') @Default('') String type,
    @JsonKey(name: 'challenge_id') @Default(0) int challengeId,
    @JsonKey(name: 'affirmation_id') @Default(0) int affirmationId,
    @JsonKey(name: 'grateful_id') @Default(0) int gratefulId,
    @JsonKey(name: 'habit_id') @Default(0) int habitId,
    @JsonKey(name: 'days_challenge_id') @Default(0) int daysChallengeId,
    @JsonKey(name: 'notification_date') @Default('') String notificationDate,
    @JsonKey(name: 'current_utc_date') @Default('') String currentUtcDate,
    @JsonKey(name: 'user_name') @Default('') String userName,
    @JsonKey(name: 'challenge_friend_id') @Default(0) int challengeFriendId,
    @JsonKey(name: 'affirmation_title') @Default('') String affirmationTitle,
    @JsonKey(name: 'grateful_title') @Default('') String gratefulTitle,
    @JsonKey(name: 'habit_name') @Default('') String habitName,
    @JsonKey(name: 'days_challenge_title')
    @Default('')
    String daysChallengeTitle,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, Object?> json) =>
      _$NotificationModelFromJson(json);
}
