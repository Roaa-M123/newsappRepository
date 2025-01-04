import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/presentation/controllers/news_cubit/news_cubit.dart';

import '../../../core/theme/colors.dart';

class ThemeSwitchButton extends StatelessWidget {
  const ThemeSwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsAppCubit,NewsAppState>(
      builder: (context, state) {
        var cubit = NewsAppCubit.get(context);
        return Switch.adaptive(
            //activeColor: AppColors.lightColor ,
            activeTrackColor:AppColors.lightColor ,
            inactiveTrackColor:AppColors.lightPinkColor ,
            inactiveThumbColor: AppColors.whiteColor,
            value: !cubit.isLighttheme, onChanged:
            (val) {
            cubit.changeAppTheme();
        });
      },
    );
  }
}
