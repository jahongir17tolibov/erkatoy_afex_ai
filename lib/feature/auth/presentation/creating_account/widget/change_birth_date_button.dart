import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/design_system/components/birth_date_picker.dart';
import 'package:erkatoy_afex_ai/design_system/components/erkatoy_button.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/floating_ui.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/design_system/theme/app_colors.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/creating_account/bloc/create_account_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChangeBirthDateButton extends StatelessWidget {
  const ChangeBirthDateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CreateAccountBloc, CreateAccountState, DateTime?>(
      selector: (state) => state.birthdayDate,
      builder: (context, changedDate) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextView(
              text: 'Tug`ilgan sana',
              textColor: context.themeColors.onSurface,
              textSize: 12,
            ),
            getHeightSize6,
            ErkatoyButton.withIcon(
              onPressed: () {
                context.showModalPopUp(
                  child: BirthDatePicker(
                    initialDate: changedDate ?? DateTime.now(),
                    onDateTimeChanged: (newDate) {
                      context
                          .read<CreateAccountBloc>()
                          .add(OnChangeBirthDayDateCreateAccEvent(newDate));
                    },
                  ),
                );
              },
              icon: SvgPicture.asset(ImagesConstants.calendarIcon),
              text: normalDateTimeFormat(changedDate ?? DateTime.now()),
              textColor:
                  changedDate == null ? AppColors.greyForLines : context.themeColors.onSurface,
              borderSideColor: AppColors.greyForLines,
              isOutlined: true,
              buttonHeight: 48,
              elevation: 0,
              borderRadius: 10,
              textSize: 12,
              borderSideWidth: 0.2,
            ),
          ],
        );
      },
    );
  }
}
