import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:themoviebook/src/core/states/theme/theme_provider.dart';
import 'package:themoviebook/src/ui/views/welcome/components/welcome_view_strings.dart';

import 'components/welcome_components.dart';

/// define a provider for page controller
final pageControllerProvider = Provider.autoDispose<PageController>(
  (_) => PageController(),
);

/// This is the first page after the splash page,
/// It only shows the first time the app is opened
class WelcomePageView extends ConsumerStatefulWidget {
  /// welcome page view constructor
  const WelcomePageView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _WelcomePageViewState();
}

class _WelcomePageViewState extends ConsumerState<WelcomePageView> {
  final List<Widget> welcomePageComponents = <Widget>[
    const PageOne(),
    const PageTwo(),
    const PageThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Expanded(
              flex: 6,
              child: PageView.builder(
                controller: ref.watch(pageControllerProvider),
                onPageChanged: (int index) {},
                itemCount: welcomePageComponents.length,
                itemBuilder: (context, index) => welcomePageComponents[index],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: SmoothPageIndicator(
                controller: ref.watch(pageControllerProvider),
                count: welcomePageComponents.length,
                effect: const SwapEffect(
                  dotHeight: 10,
                  offset: 24,
                  dotWidth: 10,
                  type: SwapType.yRotation,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 24.0.h),
              child: ElevatedButton(
                onPressed: () {
                  ref.read(themeModeProvider.notifier).update((state) {
                    return toggleTheme(themeMode: state);
                  });
                },
                child: const Text(WelcomeViewStrings.getStarted),
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
