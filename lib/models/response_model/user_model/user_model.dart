import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: 'user_id') @Default(0) int userId,
    @JsonKey(name: 'user_token') @Default('') String userToken,
    @JsonKey(name: 'user_name') @Default('') String userName,
    @JsonKey(name: 'email') @Default('') String email,
    @JsonKey(name: 'user_profile_photo') @Default('') String userProfilePhoto,
    @JsonKey(name: 'auth_token') @Default('') String authToken,
    @JsonKey(name: 'device_push_token') @Default('') String devicePushToken,
    @JsonKey(name: 'is_challenge') @Default(0) int isChallenge,
    @JsonKey(name: 'is_bible_verse') @Default(0) int isBibleVerse,
    @JsonKey(name: 'is_motivations_notification')
    @Default(0)
    int isMotivationsNotification,
    @JsonKey(name: 'motivations_notification_time')
    @Default('')
    String motivationsNotificationTime,
    @JsonKey(name: 'is_affirmation_notification')
    @Default(0)
    int isAffirmationNotification,
    @JsonKey(name: 'affirmation_notification_time')
    @Default('')
    String affirmationNotificationTime,
    @JsonKey(name: 'device_type') @Default('') String deviceType,
    @JsonKey(name: 'time_zone') @Default('') String timeZone,
    @JsonKey(name: 'badge') @Default(0) int badge,
    @JsonKey(name: 'verify_forgot_code') @Default('') String verifyForgotCode,
    @JsonKey(name: 'is_logged_out') @Default(0) int isLoggedOut,
    @JsonKey(name: 'register_time') @Default('') String registerTime,
    @JsonKey(name: 'is_subscription_activated')
    @Default(0)
    int isSubscriptionActivated,
    @JsonKey(name: 'original_transaction_id')
    @Default('')
    String originalTransactionId,
    @JsonKey(name: 'subscription_start_date')
    @Default('')
    String subscriptionStartDate,
    @JsonKey(name: 'subscription_end_date')
    @Default('')
    String subscriptionEndDate,
    @JsonKey(name: 'subscription_product')
    @Default('')
    String subscriptionProduct,
    @JsonKey(name: 'is_android_purchased') @Default(0) int isAndroidPurchased,
    @JsonKey(name: 'is_auto_renewal_subscription')
    @Default(0)
    int isAutoRenewalSubscription,
    @JsonKey(name: 'is_admin') @Default(0) int isAdmin,
    @JsonKey(name: 'receipt_url') @Default('') String receiptUrl,
    @JsonKey(name: 'is_subscription_downgrade')
    @Default(0)
    int isSubscriptionDowngrade,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
