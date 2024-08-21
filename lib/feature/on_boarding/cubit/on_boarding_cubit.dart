import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erkatoy_afex_ai/core/constants/hive_constants.dart';
import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/core/provider/local/hive_local_storage.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit({required this.localStorage}) : super(const OnBoardingState());

  final HiveLocalStorage localStorage;

  void initOnBoarding() {
    final listOfItems = <OnBoardingModel>[
      OnBoardingModel(
        image: ImagesConstants.motherAndBabyImg,
        title: 'Parvarish',
        subtitle: 'Yangi tug`ilgan chaqaloqni to`g`ri parvarishlash haqida maslahatlar',
      ),
      OnBoardingModel(
        image: ImagesConstants.childHealthImg,
        title: 'Salomatlik',
        subtitle:
            'Chaqaloq salomatligini yaxshilash uchun foydali maslahatlar, kasalliklar haqida ma`lumotlar va kunlik jadval',
      ),
      OnBoardingModel(
        image: ImagesConstants.aiBotImg,
        title: 'AI chatbot',
        subtitle:
            'Nafaqat chaqaloqlar balki odam salomatligi haqida barcha savollarga javob beradigan tezkor suniy intellekt chatboti',
      ),
    ];
    emit(state.copyWith(onBoardingDataList: listOfItems));
  }

  void onBoardingPageChanged(int index) {
    emit(state.copyWith(pageIndex: index));
  }

  Future<void> onBoardingCompleted() async {
    await localStorage.saveBool(
        boxName: HiveConstants.authTokenBoxName, key: HiveConstants.onBoardingKey, value: true);
  }
}
