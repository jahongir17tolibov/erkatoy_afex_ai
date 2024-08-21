part of 'on_boarding_cubit.dart';

class OnBoardingState extends Equatable {
  const OnBoardingState({this.pageIndex = 0, this.onBoardingDataList = const []});

  final int pageIndex;
  final List<OnBoardingModel> onBoardingDataList;

  OnBoardingState copyWith({
    int? pageIndex,
    List<OnBoardingModel>? onBoardingDataList,
  }) =>
      OnBoardingState(
        pageIndex: pageIndex ?? this.pageIndex,
        onBoardingDataList: onBoardingDataList ?? this.onBoardingDataList,
      );

  @override
  List<Object?> get props => [pageIndex, onBoardingDataList];
}

class OnBoardingModel {
  OnBoardingModel({required this.image, required this.title, required this.subtitle});

  final String image;
  final String title;
  final String subtitle;
}
