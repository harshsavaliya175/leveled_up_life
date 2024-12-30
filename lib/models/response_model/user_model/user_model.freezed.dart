// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_token')
  String get userToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_name')
  String get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_profile_photo')
  String get userProfilePhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'auth_token')
  String get authToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_push_token')
  String get devicePushToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_challenge')
  int get isChallenge => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_bible_verse')
  int get isBibleVerse => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_motivations_notification')
  int get isMotivationsNotification => throw _privateConstructorUsedError;
  @JsonKey(name: 'motivations_notification_time')
  String get motivationsNotificationTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_affirmation_notification')
  int get isAffirmationNotification => throw _privateConstructorUsedError;
  @JsonKey(name: 'affirmation_notification_time')
  String get affirmationNotificationTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_type')
  String get deviceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_zone')
  String get timeZone => throw _privateConstructorUsedError;
  @JsonKey(name: 'badge')
  int get badge => throw _privateConstructorUsedError;
  @JsonKey(name: 'verify_forgot_code')
  String get verifyForgotCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_logged_out')
  int get isLoggedOut => throw _privateConstructorUsedError;
  @JsonKey(name: 'register_time')
  String get registerTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_subscription_activated')
  int get isSubscriptionActivated => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_transaction_id')
  String get originalTransactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'subscription_start_date')
  String get subscriptionStartDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'subscription_end_date')
  String get subscriptionEndDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'subscription_product')
  String get subscriptionProduct => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_android_purchased')
  int get isAndroidPurchased => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_auto_renewal_subscription')
  int get isAutoRenewalSubscription => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_admin')
  int get isAdmin => throw _privateConstructorUsedError;
  @JsonKey(name: 'receipt_url')
  String get receiptUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_subscription_downgrade')
  int get isSubscriptionDowngrade => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'user_token') String userToken,
      @JsonKey(name: 'user_name') String userName,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'user_profile_photo') String userProfilePhoto,
      @JsonKey(name: 'auth_token') String authToken,
      @JsonKey(name: 'device_push_token') String devicePushToken,
      @JsonKey(name: 'is_challenge') int isChallenge,
      @JsonKey(name: 'is_bible_verse') int isBibleVerse,
      @JsonKey(name: 'is_motivations_notification')
      int isMotivationsNotification,
      @JsonKey(name: 'motivations_notification_time')
      String motivationsNotificationTime,
      @JsonKey(name: 'is_affirmation_notification')
      int isAffirmationNotification,
      @JsonKey(name: 'affirmation_notification_time')
      String affirmationNotificationTime,
      @JsonKey(name: 'device_type') String deviceType,
      @JsonKey(name: 'time_zone') String timeZone,
      @JsonKey(name: 'badge') int badge,
      @JsonKey(name: 'verify_forgot_code') String verifyForgotCode,
      @JsonKey(name: 'is_logged_out') int isLoggedOut,
      @JsonKey(name: 'register_time') String registerTime,
      @JsonKey(name: 'is_subscription_activated') int isSubscriptionActivated,
      @JsonKey(name: 'original_transaction_id') String originalTransactionId,
      @JsonKey(name: 'subscription_start_date') String subscriptionStartDate,
      @JsonKey(name: 'subscription_end_date') String subscriptionEndDate,
      @JsonKey(name: 'subscription_product') String subscriptionProduct,
      @JsonKey(name: 'is_android_purchased') int isAndroidPurchased,
      @JsonKey(name: 'is_auto_renewal_subscription')
      int isAutoRenewalSubscription,
      @JsonKey(name: 'is_admin') int isAdmin,
      @JsonKey(name: 'receipt_url') String receiptUrl,
      @JsonKey(name: 'is_subscription_downgrade') int isSubscriptionDowngrade});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userToken = null,
    Object? userName = null,
    Object? email = null,
    Object? userProfilePhoto = null,
    Object? authToken = null,
    Object? devicePushToken = null,
    Object? isChallenge = null,
    Object? isBibleVerse = null,
    Object? isMotivationsNotification = null,
    Object? motivationsNotificationTime = null,
    Object? isAffirmationNotification = null,
    Object? affirmationNotificationTime = null,
    Object? deviceType = null,
    Object? timeZone = null,
    Object? badge = null,
    Object? verifyForgotCode = null,
    Object? isLoggedOut = null,
    Object? registerTime = null,
    Object? isSubscriptionActivated = null,
    Object? originalTransactionId = null,
    Object? subscriptionStartDate = null,
    Object? subscriptionEndDate = null,
    Object? subscriptionProduct = null,
    Object? isAndroidPurchased = null,
    Object? isAutoRenewalSubscription = null,
    Object? isAdmin = null,
    Object? receiptUrl = null,
    Object? isSubscriptionDowngrade = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      userToken: null == userToken
          ? _value.userToken
          : userToken // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userProfilePhoto: null == userProfilePhoto
          ? _value.userProfilePhoto
          : userProfilePhoto // ignore: cast_nullable_to_non_nullable
              as String,
      authToken: null == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String,
      devicePushToken: null == devicePushToken
          ? _value.devicePushToken
          : devicePushToken // ignore: cast_nullable_to_non_nullable
              as String,
      isChallenge: null == isChallenge
          ? _value.isChallenge
          : isChallenge // ignore: cast_nullable_to_non_nullable
              as int,
      isBibleVerse: null == isBibleVerse
          ? _value.isBibleVerse
          : isBibleVerse // ignore: cast_nullable_to_non_nullable
              as int,
      isMotivationsNotification: null == isMotivationsNotification
          ? _value.isMotivationsNotification
          : isMotivationsNotification // ignore: cast_nullable_to_non_nullable
              as int,
      motivationsNotificationTime: null == motivationsNotificationTime
          ? _value.motivationsNotificationTime
          : motivationsNotificationTime // ignore: cast_nullable_to_non_nullable
              as String,
      isAffirmationNotification: null == isAffirmationNotification
          ? _value.isAffirmationNotification
          : isAffirmationNotification // ignore: cast_nullable_to_non_nullable
              as int,
      affirmationNotificationTime: null == affirmationNotificationTime
          ? _value.affirmationNotificationTime
          : affirmationNotificationTime // ignore: cast_nullable_to_non_nullable
              as String,
      deviceType: null == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String,
      timeZone: null == timeZone
          ? _value.timeZone
          : timeZone // ignore: cast_nullable_to_non_nullable
              as String,
      badge: null == badge
          ? _value.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as int,
      verifyForgotCode: null == verifyForgotCode
          ? _value.verifyForgotCode
          : verifyForgotCode // ignore: cast_nullable_to_non_nullable
              as String,
      isLoggedOut: null == isLoggedOut
          ? _value.isLoggedOut
          : isLoggedOut // ignore: cast_nullable_to_non_nullable
              as int,
      registerTime: null == registerTime
          ? _value.registerTime
          : registerTime // ignore: cast_nullable_to_non_nullable
              as String,
      isSubscriptionActivated: null == isSubscriptionActivated
          ? _value.isSubscriptionActivated
          : isSubscriptionActivated // ignore: cast_nullable_to_non_nullable
              as int,
      originalTransactionId: null == originalTransactionId
          ? _value.originalTransactionId
          : originalTransactionId // ignore: cast_nullable_to_non_nullable
              as String,
      subscriptionStartDate: null == subscriptionStartDate
          ? _value.subscriptionStartDate
          : subscriptionStartDate // ignore: cast_nullable_to_non_nullable
              as String,
      subscriptionEndDate: null == subscriptionEndDate
          ? _value.subscriptionEndDate
          : subscriptionEndDate // ignore: cast_nullable_to_non_nullable
              as String,
      subscriptionProduct: null == subscriptionProduct
          ? _value.subscriptionProduct
          : subscriptionProduct // ignore: cast_nullable_to_non_nullable
              as String,
      isAndroidPurchased: null == isAndroidPurchased
          ? _value.isAndroidPurchased
          : isAndroidPurchased // ignore: cast_nullable_to_non_nullable
              as int,
      isAutoRenewalSubscription: null == isAutoRenewalSubscription
          ? _value.isAutoRenewalSubscription
          : isAutoRenewalSubscription // ignore: cast_nullable_to_non_nullable
              as int,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as int,
      receiptUrl: null == receiptUrl
          ? _value.receiptUrl
          : receiptUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isSubscriptionDowngrade: null == isSubscriptionDowngrade
          ? _value.isSubscriptionDowngrade
          : isSubscriptionDowngrade // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'user_token') String userToken,
      @JsonKey(name: 'user_name') String userName,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'user_profile_photo') String userProfilePhoto,
      @JsonKey(name: 'auth_token') String authToken,
      @JsonKey(name: 'device_push_token') String devicePushToken,
      @JsonKey(name: 'is_challenge') int isChallenge,
      @JsonKey(name: 'is_bible_verse') int isBibleVerse,
      @JsonKey(name: 'is_motivations_notification')
      int isMotivationsNotification,
      @JsonKey(name: 'motivations_notification_time')
      String motivationsNotificationTime,
      @JsonKey(name: 'is_affirmation_notification')
      int isAffirmationNotification,
      @JsonKey(name: 'affirmation_notification_time')
      String affirmationNotificationTime,
      @JsonKey(name: 'device_type') String deviceType,
      @JsonKey(name: 'time_zone') String timeZone,
      @JsonKey(name: 'badge') int badge,
      @JsonKey(name: 'verify_forgot_code') String verifyForgotCode,
      @JsonKey(name: 'is_logged_out') int isLoggedOut,
      @JsonKey(name: 'register_time') String registerTime,
      @JsonKey(name: 'is_subscription_activated') int isSubscriptionActivated,
      @JsonKey(name: 'original_transaction_id') String originalTransactionId,
      @JsonKey(name: 'subscription_start_date') String subscriptionStartDate,
      @JsonKey(name: 'subscription_end_date') String subscriptionEndDate,
      @JsonKey(name: 'subscription_product') String subscriptionProduct,
      @JsonKey(name: 'is_android_purchased') int isAndroidPurchased,
      @JsonKey(name: 'is_auto_renewal_subscription')
      int isAutoRenewalSubscription,
      @JsonKey(name: 'is_admin') int isAdmin,
      @JsonKey(name: 'receipt_url') String receiptUrl,
      @JsonKey(name: 'is_subscription_downgrade') int isSubscriptionDowngrade});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userToken = null,
    Object? userName = null,
    Object? email = null,
    Object? userProfilePhoto = null,
    Object? authToken = null,
    Object? devicePushToken = null,
    Object? isChallenge = null,
    Object? isBibleVerse = null,
    Object? isMotivationsNotification = null,
    Object? motivationsNotificationTime = null,
    Object? isAffirmationNotification = null,
    Object? affirmationNotificationTime = null,
    Object? deviceType = null,
    Object? timeZone = null,
    Object? badge = null,
    Object? verifyForgotCode = null,
    Object? isLoggedOut = null,
    Object? registerTime = null,
    Object? isSubscriptionActivated = null,
    Object? originalTransactionId = null,
    Object? subscriptionStartDate = null,
    Object? subscriptionEndDate = null,
    Object? subscriptionProduct = null,
    Object? isAndroidPurchased = null,
    Object? isAutoRenewalSubscription = null,
    Object? isAdmin = null,
    Object? receiptUrl = null,
    Object? isSubscriptionDowngrade = null,
  }) {
    return _then(_$UserModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      userToken: null == userToken
          ? _value.userToken
          : userToken // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userProfilePhoto: null == userProfilePhoto
          ? _value.userProfilePhoto
          : userProfilePhoto // ignore: cast_nullable_to_non_nullable
              as String,
      authToken: null == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String,
      devicePushToken: null == devicePushToken
          ? _value.devicePushToken
          : devicePushToken // ignore: cast_nullable_to_non_nullable
              as String,
      isChallenge: null == isChallenge
          ? _value.isChallenge
          : isChallenge // ignore: cast_nullable_to_non_nullable
              as int,
      isBibleVerse: null == isBibleVerse
          ? _value.isBibleVerse
          : isBibleVerse // ignore: cast_nullable_to_non_nullable
              as int,
      isMotivationsNotification: null == isMotivationsNotification
          ? _value.isMotivationsNotification
          : isMotivationsNotification // ignore: cast_nullable_to_non_nullable
              as int,
      motivationsNotificationTime: null == motivationsNotificationTime
          ? _value.motivationsNotificationTime
          : motivationsNotificationTime // ignore: cast_nullable_to_non_nullable
              as String,
      isAffirmationNotification: null == isAffirmationNotification
          ? _value.isAffirmationNotification
          : isAffirmationNotification // ignore: cast_nullable_to_non_nullable
              as int,
      affirmationNotificationTime: null == affirmationNotificationTime
          ? _value.affirmationNotificationTime
          : affirmationNotificationTime // ignore: cast_nullable_to_non_nullable
              as String,
      deviceType: null == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String,
      timeZone: null == timeZone
          ? _value.timeZone
          : timeZone // ignore: cast_nullable_to_non_nullable
              as String,
      badge: null == badge
          ? _value.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as int,
      verifyForgotCode: null == verifyForgotCode
          ? _value.verifyForgotCode
          : verifyForgotCode // ignore: cast_nullable_to_non_nullable
              as String,
      isLoggedOut: null == isLoggedOut
          ? _value.isLoggedOut
          : isLoggedOut // ignore: cast_nullable_to_non_nullable
              as int,
      registerTime: null == registerTime
          ? _value.registerTime
          : registerTime // ignore: cast_nullable_to_non_nullable
              as String,
      isSubscriptionActivated: null == isSubscriptionActivated
          ? _value.isSubscriptionActivated
          : isSubscriptionActivated // ignore: cast_nullable_to_non_nullable
              as int,
      originalTransactionId: null == originalTransactionId
          ? _value.originalTransactionId
          : originalTransactionId // ignore: cast_nullable_to_non_nullable
              as String,
      subscriptionStartDate: null == subscriptionStartDate
          ? _value.subscriptionStartDate
          : subscriptionStartDate // ignore: cast_nullable_to_non_nullable
              as String,
      subscriptionEndDate: null == subscriptionEndDate
          ? _value.subscriptionEndDate
          : subscriptionEndDate // ignore: cast_nullable_to_non_nullable
              as String,
      subscriptionProduct: null == subscriptionProduct
          ? _value.subscriptionProduct
          : subscriptionProduct // ignore: cast_nullable_to_non_nullable
              as String,
      isAndroidPurchased: null == isAndroidPurchased
          ? _value.isAndroidPurchased
          : isAndroidPurchased // ignore: cast_nullable_to_non_nullable
              as int,
      isAutoRenewalSubscription: null == isAutoRenewalSubscription
          ? _value.isAutoRenewalSubscription
          : isAutoRenewalSubscription // ignore: cast_nullable_to_non_nullable
              as int,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as int,
      receiptUrl: null == receiptUrl
          ? _value.receiptUrl
          : receiptUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isSubscriptionDowngrade: null == isSubscriptionDowngrade
          ? _value.isSubscriptionDowngrade
          : isSubscriptionDowngrade // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {@JsonKey(name: 'user_id') this.userId = 0,
      @JsonKey(name: 'user_token') this.userToken = '',
      @JsonKey(name: 'user_name') this.userName = '',
      @JsonKey(name: 'email') this.email = '',
      @JsonKey(name: 'user_profile_photo') this.userProfilePhoto = '',
      @JsonKey(name: 'auth_token') this.authToken = '',
      @JsonKey(name: 'device_push_token') this.devicePushToken = '',
      @JsonKey(name: 'is_challenge') this.isChallenge = 0,
      @JsonKey(name: 'is_bible_verse') this.isBibleVerse = 0,
      @JsonKey(name: 'is_motivations_notification')
      this.isMotivationsNotification = 0,
      @JsonKey(name: 'motivations_notification_time')
      this.motivationsNotificationTime = '',
      @JsonKey(name: 'is_affirmation_notification')
      this.isAffirmationNotification = 0,
      @JsonKey(name: 'affirmation_notification_time')
      this.affirmationNotificationTime = '',
      @JsonKey(name: 'device_type') this.deviceType = '',
      @JsonKey(name: 'time_zone') this.timeZone = '',
      @JsonKey(name: 'badge') this.badge = 0,
      @JsonKey(name: 'verify_forgot_code') this.verifyForgotCode = '',
      @JsonKey(name: 'is_logged_out') this.isLoggedOut = 0,
      @JsonKey(name: 'register_time') this.registerTime = '',
      @JsonKey(name: 'is_subscription_activated')
      this.isSubscriptionActivated = 0,
      @JsonKey(name: 'original_transaction_id') this.originalTransactionId = '',
      @JsonKey(name: 'subscription_start_date') this.subscriptionStartDate = '',
      @JsonKey(name: 'subscription_end_date') this.subscriptionEndDate = '',
      @JsonKey(name: 'subscription_product') this.subscriptionProduct = '',
      @JsonKey(name: 'is_android_purchased') this.isAndroidPurchased = 0,
      @JsonKey(name: 'is_auto_renewal_subscription')
      this.isAutoRenewalSubscription = 0,
      @JsonKey(name: 'is_admin') this.isAdmin = 0,
      @JsonKey(name: 'receipt_url') this.receiptUrl = '',
      @JsonKey(name: 'is_subscription_downgrade')
      this.isSubscriptionDowngrade = 0});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'user_token')
  final String userToken;
  @override
  @JsonKey(name: 'user_name')
  final String userName;
  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'user_profile_photo')
  final String userProfilePhoto;
  @override
  @JsonKey(name: 'auth_token')
  final String authToken;
  @override
  @JsonKey(name: 'device_push_token')
  final String devicePushToken;
  @override
  @JsonKey(name: 'is_challenge')
  final int isChallenge;
  @override
  @JsonKey(name: 'is_bible_verse')
  final int isBibleVerse;
  @override
  @JsonKey(name: 'is_motivations_notification')
  final int isMotivationsNotification;
  @override
  @JsonKey(name: 'motivations_notification_time')
  final String motivationsNotificationTime;
  @override
  @JsonKey(name: 'is_affirmation_notification')
  final int isAffirmationNotification;
  @override
  @JsonKey(name: 'affirmation_notification_time')
  final String affirmationNotificationTime;
  @override
  @JsonKey(name: 'device_type')
  final String deviceType;
  @override
  @JsonKey(name: 'time_zone')
  final String timeZone;
  @override
  @JsonKey(name: 'badge')
  final int badge;
  @override
  @JsonKey(name: 'verify_forgot_code')
  final String verifyForgotCode;
  @override
  @JsonKey(name: 'is_logged_out')
  final int isLoggedOut;
  @override
  @JsonKey(name: 'register_time')
  final String registerTime;
  @override
  @JsonKey(name: 'is_subscription_activated')
  final int isSubscriptionActivated;
  @override
  @JsonKey(name: 'original_transaction_id')
  final String originalTransactionId;
  @override
  @JsonKey(name: 'subscription_start_date')
  final String subscriptionStartDate;
  @override
  @JsonKey(name: 'subscription_end_date')
  final String subscriptionEndDate;
  @override
  @JsonKey(name: 'subscription_product')
  final String subscriptionProduct;
  @override
  @JsonKey(name: 'is_android_purchased')
  final int isAndroidPurchased;
  @override
  @JsonKey(name: 'is_auto_renewal_subscription')
  final int isAutoRenewalSubscription;
  @override
  @JsonKey(name: 'is_admin')
  final int isAdmin;
  @override
  @JsonKey(name: 'receipt_url')
  final String receiptUrl;
  @override
  @JsonKey(name: 'is_subscription_downgrade')
  final int isSubscriptionDowngrade;

  @override
  String toString() {
    return 'UserModel(userId: $userId, userToken: $userToken, userName: $userName, email: $email, userProfilePhoto: $userProfilePhoto, authToken: $authToken, devicePushToken: $devicePushToken, isChallenge: $isChallenge, isBibleVerse: $isBibleVerse, isMotivationsNotification: $isMotivationsNotification, motivationsNotificationTime: $motivationsNotificationTime, isAffirmationNotification: $isAffirmationNotification, affirmationNotificationTime: $affirmationNotificationTime, deviceType: $deviceType, timeZone: $timeZone, badge: $badge, verifyForgotCode: $verifyForgotCode, isLoggedOut: $isLoggedOut, registerTime: $registerTime, isSubscriptionActivated: $isSubscriptionActivated, originalTransactionId: $originalTransactionId, subscriptionStartDate: $subscriptionStartDate, subscriptionEndDate: $subscriptionEndDate, subscriptionProduct: $subscriptionProduct, isAndroidPurchased: $isAndroidPurchased, isAutoRenewalSubscription: $isAutoRenewalSubscription, isAdmin: $isAdmin, receiptUrl: $receiptUrl, isSubscriptionDowngrade: $isSubscriptionDowngrade)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userToken, userToken) ||
                other.userToken == userToken) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.userProfilePhoto, userProfilePhoto) ||
                other.userProfilePhoto == userProfilePhoto) &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken) &&
            (identical(other.devicePushToken, devicePushToken) ||
                other.devicePushToken == devicePushToken) &&
            (identical(other.isChallenge, isChallenge) ||
                other.isChallenge == isChallenge) &&
            (identical(other.isBibleVerse, isBibleVerse) ||
                other.isBibleVerse == isBibleVerse) &&
            (identical(other.isMotivationsNotification, isMotivationsNotification) ||
                other.isMotivationsNotification == isMotivationsNotification) &&
            (identical(other.motivationsNotificationTime, motivationsNotificationTime) ||
                other.motivationsNotificationTime ==
                    motivationsNotificationTime) &&
            (identical(other.isAffirmationNotification, isAffirmationNotification) ||
                other.isAffirmationNotification == isAffirmationNotification) &&
            (identical(other.affirmationNotificationTime, affirmationNotificationTime) ||
                other.affirmationNotificationTime ==
                    affirmationNotificationTime) &&
            (identical(other.deviceType, deviceType) ||
                other.deviceType == deviceType) &&
            (identical(other.timeZone, timeZone) ||
                other.timeZone == timeZone) &&
            (identical(other.badge, badge) || other.badge == badge) &&
            (identical(other.verifyForgotCode, verifyForgotCode) ||
                other.verifyForgotCode == verifyForgotCode) &&
            (identical(other.isLoggedOut, isLoggedOut) ||
                other.isLoggedOut == isLoggedOut) &&
            (identical(other.registerTime, registerTime) ||
                other.registerTime == registerTime) &&
            (identical(other.isSubscriptionActivated, isSubscriptionActivated) ||
                other.isSubscriptionActivated == isSubscriptionActivated) &&
            (identical(other.originalTransactionId, originalTransactionId) ||
                other.originalTransactionId == originalTransactionId) &&
            (identical(other.subscriptionStartDate, subscriptionStartDate) ||
                other.subscriptionStartDate == subscriptionStartDate) &&
            (identical(other.subscriptionEndDate, subscriptionEndDate) ||
                other.subscriptionEndDate == subscriptionEndDate) &&
            (identical(other.subscriptionProduct, subscriptionProduct) ||
                other.subscriptionProduct == subscriptionProduct) &&
            (identical(other.isAndroidPurchased, isAndroidPurchased) ||
                other.isAndroidPurchased == isAndroidPurchased) &&
            (identical(other.isAutoRenewalSubscription, isAutoRenewalSubscription) ||
                other.isAutoRenewalSubscription == isAutoRenewalSubscription) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin) &&
            (identical(other.receiptUrl, receiptUrl) ||
                other.receiptUrl == receiptUrl) &&
            (identical(other.isSubscriptionDowngrade, isSubscriptionDowngrade) ||
                other.isSubscriptionDowngrade == isSubscriptionDowngrade));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        userId,
        userToken,
        userName,
        email,
        userProfilePhoto,
        authToken,
        devicePushToken,
        isChallenge,
        isBibleVerse,
        isMotivationsNotification,
        motivationsNotificationTime,
        isAffirmationNotification,
        affirmationNotificationTime,
        deviceType,
        timeZone,
        badge,
        verifyForgotCode,
        isLoggedOut,
        registerTime,
        isSubscriptionActivated,
        originalTransactionId,
        subscriptionStartDate,
        subscriptionEndDate,
        subscriptionProduct,
        isAndroidPurchased,
        isAutoRenewalSubscription,
        isAdmin,
        receiptUrl,
        isSubscriptionDowngrade
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {@JsonKey(name: 'user_id') final int userId,
      @JsonKey(name: 'user_token') final String userToken,
      @JsonKey(name: 'user_name') final String userName,
      @JsonKey(name: 'email') final String email,
      @JsonKey(name: 'user_profile_photo') final String userProfilePhoto,
      @JsonKey(name: 'auth_token') final String authToken,
      @JsonKey(name: 'device_push_token') final String devicePushToken,
      @JsonKey(name: 'is_challenge') final int isChallenge,
      @JsonKey(name: 'is_bible_verse') final int isBibleVerse,
      @JsonKey(name: 'is_motivations_notification')
      final int isMotivationsNotification,
      @JsonKey(name: 'motivations_notification_time')
      final String motivationsNotificationTime,
      @JsonKey(name: 'is_affirmation_notification')
      final int isAffirmationNotification,
      @JsonKey(name: 'affirmation_notification_time')
      final String affirmationNotificationTime,
      @JsonKey(name: 'device_type') final String deviceType,
      @JsonKey(name: 'time_zone') final String timeZone,
      @JsonKey(name: 'badge') final int badge,
      @JsonKey(name: 'verify_forgot_code') final String verifyForgotCode,
      @JsonKey(name: 'is_logged_out') final int isLoggedOut,
      @JsonKey(name: 'register_time') final String registerTime,
      @JsonKey(name: 'is_subscription_activated')
      final int isSubscriptionActivated,
      @JsonKey(name: 'original_transaction_id')
      final String originalTransactionId,
      @JsonKey(name: 'subscription_start_date')
      final String subscriptionStartDate,
      @JsonKey(name: 'subscription_end_date') final String subscriptionEndDate,
      @JsonKey(name: 'subscription_product') final String subscriptionProduct,
      @JsonKey(name: 'is_android_purchased') final int isAndroidPurchased,
      @JsonKey(name: 'is_auto_renewal_subscription')
      final int isAutoRenewalSubscription,
      @JsonKey(name: 'is_admin') final int isAdmin,
      @JsonKey(name: 'receipt_url') final String receiptUrl,
      @JsonKey(name: 'is_subscription_downgrade')
      final int isSubscriptionDowngrade}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'user_token')
  String get userToken;
  @override
  @JsonKey(name: 'user_name')
  String get userName;
  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(name: 'user_profile_photo')
  String get userProfilePhoto;
  @override
  @JsonKey(name: 'auth_token')
  String get authToken;
  @override
  @JsonKey(name: 'device_push_token')
  String get devicePushToken;
  @override
  @JsonKey(name: 'is_challenge')
  int get isChallenge;
  @override
  @JsonKey(name: 'is_bible_verse')
  int get isBibleVerse;
  @override
  @JsonKey(name: 'is_motivations_notification')
  int get isMotivationsNotification;
  @override
  @JsonKey(name: 'motivations_notification_time')
  String get motivationsNotificationTime;
  @override
  @JsonKey(name: 'is_affirmation_notification')
  int get isAffirmationNotification;
  @override
  @JsonKey(name: 'affirmation_notification_time')
  String get affirmationNotificationTime;
  @override
  @JsonKey(name: 'device_type')
  String get deviceType;
  @override
  @JsonKey(name: 'time_zone')
  String get timeZone;
  @override
  @JsonKey(name: 'badge')
  int get badge;
  @override
  @JsonKey(name: 'verify_forgot_code')
  String get verifyForgotCode;
  @override
  @JsonKey(name: 'is_logged_out')
  int get isLoggedOut;
  @override
  @JsonKey(name: 'register_time')
  String get registerTime;
  @override
  @JsonKey(name: 'is_subscription_activated')
  int get isSubscriptionActivated;
  @override
  @JsonKey(name: 'original_transaction_id')
  String get originalTransactionId;
  @override
  @JsonKey(name: 'subscription_start_date')
  String get subscriptionStartDate;
  @override
  @JsonKey(name: 'subscription_end_date')
  String get subscriptionEndDate;
  @override
  @JsonKey(name: 'subscription_product')
  String get subscriptionProduct;
  @override
  @JsonKey(name: 'is_android_purchased')
  int get isAndroidPurchased;
  @override
  @JsonKey(name: 'is_auto_renewal_subscription')
  int get isAutoRenewalSubscription;
  @override
  @JsonKey(name: 'is_admin')
  int get isAdmin;
  @override
  @JsonKey(name: 'receipt_url')
  String get receiptUrl;
  @override
  @JsonKey(name: 'is_subscription_downgrade')
  int get isSubscriptionDowngrade;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
