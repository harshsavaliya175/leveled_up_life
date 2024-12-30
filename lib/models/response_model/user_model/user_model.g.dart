// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      userId: (json['user_id'] as num?)?.toInt() ?? 0,
      userToken: json['user_token'] as String? ?? '',
      userName: json['user_name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      userProfilePhoto: json['user_profile_photo'] as String? ?? '',
      authToken: json['auth_token'] as String? ?? '',
      devicePushToken: json['device_push_token'] as String? ?? '',
      isChallenge: (json['is_challenge'] as num?)?.toInt() ?? 0,
      isBibleVerse: (json['is_bible_verse'] as num?)?.toInt() ?? 0,
      isMotivationsNotification:
          (json['is_motivations_notification'] as num?)?.toInt() ?? 0,
      motivationsNotificationTime:
          json['motivations_notification_time'] as String? ?? '',
      isAffirmationNotification:
          (json['is_affirmation_notification'] as num?)?.toInt() ?? 0,
      affirmationNotificationTime:
          json['affirmation_notification_time'] as String? ?? '',
      deviceType: json['device_type'] as String? ?? '',
      timeZone: json['time_zone'] as String? ?? '',
      badge: (json['badge'] as num?)?.toInt() ?? 0,
      verifyForgotCode: json['verify_forgot_code'] as String? ?? '',
      isLoggedOut: (json['is_logged_out'] as num?)?.toInt() ?? 0,
      registerTime: json['register_time'] as String? ?? '',
      isSubscriptionActivated:
          (json['is_subscription_activated'] as num?)?.toInt() ?? 0,
      originalTransactionId: json['original_transaction_id'] as String? ?? '',
      subscriptionStartDate: json['subscription_start_date'] as String? ?? '',
      subscriptionEndDate: json['subscription_end_date'] as String? ?? '',
      subscriptionProduct: json['subscription_product'] as String? ?? '',
      isAndroidPurchased: (json['is_android_purchased'] as num?)?.toInt() ?? 0,
      isAutoRenewalSubscription:
          (json['is_auto_renewal_subscription'] as num?)?.toInt() ?? 0,
      isAdmin: (json['is_admin'] as num?)?.toInt() ?? 0,
      receiptUrl: json['receipt_url'] as String? ?? '',
      isSubscriptionDowngrade:
          (json['is_subscription_downgrade'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'user_token': instance.userToken,
      'user_name': instance.userName,
      'email': instance.email,
      'user_profile_photo': instance.userProfilePhoto,
      'auth_token': instance.authToken,
      'device_push_token': instance.devicePushToken,
      'is_challenge': instance.isChallenge,
      'is_bible_verse': instance.isBibleVerse,
      'is_motivations_notification': instance.isMotivationsNotification,
      'motivations_notification_time': instance.motivationsNotificationTime,
      'is_affirmation_notification': instance.isAffirmationNotification,
      'affirmation_notification_time': instance.affirmationNotificationTime,
      'device_type': instance.deviceType,
      'time_zone': instance.timeZone,
      'badge': instance.badge,
      'verify_forgot_code': instance.verifyForgotCode,
      'is_logged_out': instance.isLoggedOut,
      'register_time': instance.registerTime,
      'is_subscription_activated': instance.isSubscriptionActivated,
      'original_transaction_id': instance.originalTransactionId,
      'subscription_start_date': instance.subscriptionStartDate,
      'subscription_end_date': instance.subscriptionEndDate,
      'subscription_product': instance.subscriptionProduct,
      'is_android_purchased': instance.isAndroidPurchased,
      'is_auto_renewal_subscription': instance.isAutoRenewalSubscription,
      'is_admin': instance.isAdmin,
      'receipt_url': instance.receiptUrl,
      'is_subscription_downgrade': instance.isSubscriptionDowngrade,
    };
