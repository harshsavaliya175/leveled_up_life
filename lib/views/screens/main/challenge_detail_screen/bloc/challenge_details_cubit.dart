import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leveled_up_life/api/repo/challenge_repo.dart';
import 'package:leveled_up_life/api/response_item.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/response_model/challenge_model/challenge_model.dart';

part 'challenge_details_cubit.freezed.dart';
part 'challenge_details_state.dart';

class ChallengeDetailsCubit extends Cubit<ChallengeDetailsState> {
  final ChallengeRepo _challengeRepo;

  ChallengeDetailsCubit(this._challengeRepo)
      : super(const ChallengeDetailsState());

  void changeData({ChallengeModel? challengeModel}) {
    emit(state.copyWith(
      challengeModel: challengeModel ?? state.challengeModel,
    ));
  }

  Future<bool> challengeComplete({
    required int challengeId,
    required int challengeTaskId,
  }) async {
    bool isChallengeComplete = false;
    emit(state.copyWith(responseItem: null, message: ''));
    EasyLoading.show();
    try {
      ResponseItem data = await _challengeRepo.challengeComplete(
        challengeId: challengeId,
        challengeTaskId: challengeTaskId,
      );
      emit(state.copyWith(responseItem: data, message: data.message));
      isChallengeComplete = true;
      if (data.forceLogout) {
        emit(state.copyWith(
          message: data.message,
          responseItem: null,
          isForceLogout: data.forceLogout,
        ));
      }
      EasyLoading.dismiss();
    } catch (e) {
      emit(state.copyWith(message: LocaleKeys.something_went_wrong.tr()));
      EasyLoading.dismiss();
    }
    return isChallengeComplete;
  }
}
