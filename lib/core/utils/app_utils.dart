import 'dart:developer';

import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:leveled_up_life/core/utils/preference.dart';
import 'package:leveled_up_life/service_injector.dart';

class AppUtils {
  Future<String?> generateShortUrl({
    required String challengeName,
    required String challengeId,
    bool isActive = true,
  }) async {
    BranchUniversalObject buo = BranchUniversalObject(
      canonicalIdentifier: '75plg/branch',
      title: 'Leveled Up Life',
      contentDescription: 'You have been invite to join : $challengeName',
      keywords: ['Leveled Up Life', 'Challenge', 'Invitation', 'Event'],
      contentMetadata: BranchContentMetaData()
        ..addCustomMetadata('challenge_id', challengeId)
        ..addCustomMetadata('challenge_name', challengeName)
        ..addCustomMetadata(
          'user_token',
          si.get<SharedPreference>().getString(SharedPreference.userToken),
        )
        ..addCustomMetadata('is_active', isActive),
    );

    BranchResponse response = await FlutterBranchSdk.getShortUrl(
      buo: buo,
      linkProperties: BranchLinkProperties(feature: 'invitation'),
    );

    if (response.success) {
      log(
        'Link generated: ${response.result} for challenge: \'$challengeName\'',
        name: 'BranchIO',
      );
      return response.result;
    } else {
      log(
        'Error : ${response.errorCode} - ${response.errorMessage}',
        name: 'BranchIO',
      );
      return null;
    }
  }

  Future<String?> generateShortUrlForInviteFriend({
    bool isActive = true,
  }) async {
    BranchUniversalObject buo = BranchUniversalObject(
      canonicalIdentifier: '75plg/branch',
      title: 'Leveled Up Life',
      contentDescription:
          'You have been invited to become a friend of ${si.get<SharedPreference>().getString(SharedPreference.userName)}',
      keywords: ['Leveled Up Life', 'Friend', 'Invitation', 'Event'],
      contentMetadata: BranchContentMetaData()
        ..addCustomMetadata(
          'user_token',
          si.get<SharedPreference>().getString(SharedPreference.userToken),
        )
        ..addCustomMetadata('is_active', isActive),
    );

    BranchResponse response = await FlutterBranchSdk.getShortUrl(
      buo: buo,
      linkProperties: BranchLinkProperties(feature: 'invitation'),
    );

    if (response.success) {
      log(
        'Link generated: ${response.result}',
        name: 'BranchIO',
      );
      return response.result;
    } else {
      log(
        'Error : ${response.errorCode} - ${response.errorMessage}',
        name: 'BranchIO',
      );
      return null;
    }
  }
}
