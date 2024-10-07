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
        image: ImagesConstants.onBoardingImg1,
        title: 'Xush Kelibsiz',
        subtitle:
            "Erkatoyga Xush Kelibsiz! Farzandingiz parvarishi va salomatligi uchun aqlli yordamchi endi qo'lingizda.",
      ),
      OnBoardingModel(
        image: ImagesConstants.onBoardingImg2,
        title: 'AI chatbot',
        subtitle:
            'Nafaqat chaqaloqlar balki odam salomatligi haqida barcha savollarga javob beradigan tezkor suniy intellekt chatboti',
      ),
      OnBoardingModel(
        image: ImagesConstants.onBoardingImg3,
        title: 'Parvarish',
        subtitle:
            "Erkatoy sizning eng yaxshi yordamchingiz: farzandingizning kundalik parvarishi va sog'ligi uchun maxsus tavsiyalar",
      ),
      OnBoardingModel(
        image: ImagesConstants.onBoardingImg4,
        title: 'Salomatlik',
        subtitle:
            "Farzandingiz sog'lig'iga e'tiborli bo'ling. Erkatoy sizga kasallik belgilari va sog'liq bo'yicha maslahatlar beradi.",
      ),
      OnBoardingModel(
        image: ImagesConstants.onBoardingImg5,
        title: '',
        subtitle: "Birgalikda farzandingiz uchun eng yaxshi parvarishni ta'minlaymiz.",
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
