import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:leveled_up_life/core/utils/preference.dart';
import 'package:leveled_up_life/service_injector.dart';

class DeepLinkUtil {
  static StreamSubscription<Map> init() {
    // Future<Map<dynamic, dynamic>> data =
    FlutterBranchSdk.getFirstReferringParams().then(
      (Map<dynamic, dynamic> data) {
        if (data["challenge_id"] != null && data["challenge_id"] != "") {
          String challengeId = data["challenge_id"];
          si
              .get<SharedPreference>()
              .putString(SharedPreference.challengeId, challengeId);
        }

        if (data["user_token"] != null && data["user_token"] != "") {
          String oppositeUserToken = data["user_token"];
          si
              .get<SharedPreference>()
              .putString(SharedPreference.oppositeUserToken, oppositeUserToken);
        }
      },
    );

    StreamSubscription<Map> streamSubscriptionDeepLink =
        FlutterBranchSdk.listSession().listen(
      (Map<dynamic, dynamic> data) async {
        if (data.containsKey('+clicked_branch_link') &&
            data['+clicked_branch_link'] == true) {
          debugPrint(
              '------------------------------------Link clicked----------------------------------------------');
          debugPrint('Challenge Id: ${data['challenge_id']}');
          debugPrint('Challenge: ${data['challenge_name']}');
          debugPrint('User Token: ${data['user_token']}');
          debugPrint('IsActive: ${data['is_active']}');
          debugPrint(
              '------------------------------------------------------------------------------------------------');
          // box.write(AppConstant.invitedPartyId, data['party_id']);
          // box.write(AppConstant.invitedPartyUserToken, data['user_token']);
          // box.write(AppConstant.invitedPartyIsActive, data['is_active']);
          // if (box.read(AppConstant.userLoginData) != null) {
          //   await Future.delayed(const Duration(milliseconds: 500)).then((value) {
          //     HomeController homeController = Get.put(HomeController());
          //     homeController.inviteUser();
          //   });
          // }
          // context.showAppDialog(
          //   contentWidget: Container(
          //     height: 200,
          //     width: 200,
          //     alignment: Alignment.center,
          //     child: Text('$data'),
          //   ),
          // );
          // context.pushNamed(AppRoutes.changePassword);
          // context.read<InviteFriendsCubit>().getFriendList();
          if (data["challenge_id"] != null && data["challenge_id"] != "") {
            String challengeId = data["challenge_id"];
            si
                .get<SharedPreference>()
                .putString(SharedPreference.challengeId, challengeId);
          }
          if (data["user_token"] != null && data["user_token"] != "") {
            String oppositeUserToken = data["user_token"];
            si.get<SharedPreference>().putString(
                SharedPreference.oppositeUserToken, oppositeUserToken);
          }
        }
      },
      onError: (error) {
        PlatformException platformException = error as PlatformException;
        debugPrint(
            'InitSession error: ${platformException.code} - ${platformException.message}');
      },
    );
    return streamSubscriptionDeepLink;
  }
}
