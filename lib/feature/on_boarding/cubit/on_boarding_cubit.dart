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
        subtitle: 'Yangi tug`ilgan chaqaloqni to`g`ri parvarishlash haqida maslahatlar',
      ),
      OnBoardingModel(
        image: ImagesConstants.onBoardingImg2,
        title: 'AI chatbot',
        subtitle:
        'Chaqaloq salomatligini yaxshilash uchun foydali maslahatlar, kasalliklar haqida ma`lumotlar va kunlik jadval',
      ),
      OnBoardingModel(
        image: ImagesConstants.onBoardingImg3,
        title: 'Parvarish',
        subtitle:
        'Nafaqat chaqaloqlar balki odam salomatligi haqida barcha savollarga javob beradigan tezkor suniy intellekt chatboti',
      ),
      OnBoardingModel(
        image: ImagesConstants.onBoardingImg4,
        title: 'Salomatlik',
        subtitle:
        'Nafaqat chaqaloqlar balki odam salomatligi haqida barcha savollarga javob beradigan tezkor suniy intellekt chatboti',
      ),
      OnBoardingModel(
        image: ImagesConstants.onBoardingImg5,
        title: '',
        subtitle: 'Nafaqat chaqaloqlar balki odam salomatligi haqida barcha savollarga javob beradigan tezkor suniy intellekt chatboti',
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
