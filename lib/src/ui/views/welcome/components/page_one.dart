import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:themoviebook/src/ui/shared_views/rich_text_widget/rich_text.dart';
import 'package:themoviebook/src/ui/views/welcome/components/welcome_view_strings.dart';

/// First view on the welcome page
class PageOne extends StatelessWidget {
  /// page one constructor
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: LottieBuilder.asset("assets/animations/movie.json"),
          ),
          Gap(32.0.h),
          RichTextWidget(
            texts: [
              BaseText.plain(text: WelcomeViewStrings.pageOneStringOne),
              BaseText.highlighted(text: WelcomeViewStrings.pageOneStringTwo),
              BaseText.plain(text: WelcomeViewStrings.pageOneStringThree),
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
