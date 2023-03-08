import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:themoviebook/src/ui/shared_views/rich_text_widget/rich_text.dart';
import 'package:themoviebook/src/ui/views/welcome/components/welcome_view_strings.dart';

/// Third view on the welcome page
class PageThree extends StatelessWidget {
  /// page three constructor
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SvgPicture.asset("assets/images/onboarding/movie-2.svg"),
          ),
          Gap(32.0.h),
          RichTextWidget(
            texts: [
              BaseText.plain(text: WelcomeViewStrings.pageThreeStringOne),
              BaseText.highlighted(text: WelcomeViewStrings.pageThreeStringTwo),
              BaseText.plain(text: WelcomeViewStrings.pageThreeStringThree),
              BaseText.highlighted(text: WelcomeViewStrings.pageThreeStringFour),
              BaseText.plain(text: WelcomeViewStrings.pageThreeStringFive),
            ],
            textAlign: TextAlign.center,
            styleForAll: Theme.of(context).textTheme.titleLarge,
            linkStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
        ],
      ),
    );
  }
}
