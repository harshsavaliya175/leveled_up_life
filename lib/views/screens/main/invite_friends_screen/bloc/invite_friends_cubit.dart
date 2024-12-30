import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leveled_up_life/api/repo/challenge_repo.dart';
import 'package:leveled_up_life/api/repo/friend_repo.dart';
import 'package:leveled_up_life/api/response_item.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/core/utils/preference.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/request_model/cteate_challenge/create_challenge_data.dart';
import 'package:leveled_up_life/models/request_model/friend_and_request/friend_and_request_data.dart';
import 'package:leveled_up_life/models/response_model/friend_model/friend_model.dart';
import 'package:leveled_up_life/service_injector.dart';

part 'invite_friends_cubit.freezed.dart';
part 'invite_friends_state.dart';

class InviteFriendsCubit extends Cubit<InviteFriendsState> {
  final FriendRepo _friendRepo;
  final ChallengeRepo _challengeRepo;

  InviteFriendsCubit(this._friendRepo, this._challengeRepo)
      : super(const InviteFriendsState());
  SharedPreference preferences = si.get<SharedPreference>();

  void initData() {
    emit(const InviteFriendsState());
  }

  void setChallengeData({
    String? challengeName,
    List? taskList,
    String? startDate,
    String? endDate,
    bool? setReminder,
  }) {
    emit(state.copyWith(
      challengeName: challengeName ?? state.challengeName,
      taskList: taskList ?? state.taskList,
      startDate: startDate ?? state.startDate,
      endDate: endDate ?? state.endDate,
      isReminderStart: setReminder ?? state.isReminderStart,
      message: '',
      responseItem: null,
    ));
  }

  Future<void> createChallenge() async {
    emit(state.copyWith(responseItem: null, message: ''));
    if (state.tokens.isEmpty) {
      emit(state.copyWith(
        message: LocaleKeys.select_at_least_one_challenger.tr(),
      ));
    } else {
      String? userToken = preferences.getString(SharedPreference.userToken);
      List tokens = state.tokens;
      List tokensNew = [];
      tokensNew.addAll(tokens);
      tokensNew.add(userToken ?? '');
      EasyLoading.show();
      try {
        ResponseItem data = await _challengeRepo.createChallenge(
          CreateChallengeData(
            challengeName: state.challengeName,
            taskName: state.taskList,
            challengeStartDate:
                DateTime.parse(state.startDate).toUtc().toString(),
            challengeEndDate: DateTime.parse(state.endDate).toUtc().toString(),
            isSetReminder: state.isReminderStart ? 1 : 0,
            userTokens: tokensNew,
          ),
        );
        // if (data.status) {
        //   ChallengeModel challengeModel = ChallengeModel.fromJson(data.data);
        //   String? generateShortUrl = await si.get<AppUtils>().generateShortUrl(
        //         challengeName: challengeModel.challengeName ?? '',
        //         challengeId: challengeModel.challengeId ?? 0,
        //       );
        //
        //   log("generateShortUrl ------------------> $generateShortUrl");
        // }
        emit(
          state.copyWith(
            message: data.message,
            responseItem: data,
          ),
        );
        EasyLoading.dismiss();
      } catch (e) {
        emit(state.copyWith(message: LocaleKeys.something_went_wrong.tr()));
        EasyLoading.dismiss();
      }
    }
  }

  Future<void> getFriendList() async {
    emit(state.copyWith(responseItem: null, message: '', page: 1));
    EasyLoading.show();
    try {
      ResponseItem data =
          await _friendRepo.getFriendsAndRequestList(FriendAndRequestData(
        state.page,
        limit,
        friend,
      ));
      List<FriendModel?> friendModelList = [];
      if (data.status) {
        List friendList = data.data as List;
        for (var element in friendList) {
          friendModelList.add(FriendModel.fromJson(element));
        }
      }
      emit(state.copyWith(friendModelList: friendModelList));
      EasyLoading.dismiss();
    } catch (e) {
      emit(state.copyWith(message: LocaleKeys.something_went_wrong.tr()));
      EasyLoading.dismiss();
    }
  }

  Future<void> loadMoreFriendData() async {
    if (state.friendModelList.length == limit * state.page) {
      emit(state.copyWith(
          page: state.page + 1, message: '', isPaginationLoader: true));
      try {
        ResponseItem data =
            await _friendRepo.getFriendsAndRequestList(FriendAndRequestData(
          state.page,
          limit,
          friend,
        ));
        List<FriendModel?> friendModelList = state.friendModelList;
        List<FriendModel?> friendModelListNew = [];
        friendModelListNew.addAll(friendModelList);
        List<FriendModel?> newLoadedData = [];
        if (data.status) {
          List friendList = data.data as List;
          for (var element in friendList) {
            newLoadedData.add(FriendModel.fromJson(element));
          }
        }
        friendModelListNew.addAll(newLoadedData);
        emit(
          state.copyWith(
            friendModelList: friendModelListNew,
            isPaginationLoader: false,
          ),
        );
        EasyLoading.dismiss();
      } catch (e) {
        emit(state.copyWith(message: LocaleKeys.something_went_wrong.tr()));
        EasyLoading.dismiss();
      }
    }
  }

  void createUsersTokenList(int index) {
    emit(state.copyWith(message: '', responseItem: null));
    List userTokens = state.tokens;
    List userTokensNew = [];
    userTokensNew.addAll(userTokens);
    List<FriendModel?> friends = state.friendModelList;
    List<FriendModel?> friendsNew = [];
    friendsNew.addAll(friends);
    FriendModel? friend = friendsNew[index];
    friend = friend?.copyWith(isSelect: !(friend.isSelect));
    friendsNew[index] = friend;
    if ((friend?.isSelect ?? false) == true) {
      userTokensNew.add(friend?.userToken ?? '');
    } else {
      userTokensNew.remove(friend?.userToken ?? '');
    }
    emit(state.copyWith(friendModelList: friendsNew, tokens: userTokensNew));
  }
}
