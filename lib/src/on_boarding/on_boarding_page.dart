import 'package:flutter/material.dart';
import 'package:flutter_messenger/core/config/shared_prefences_keys.dart';
import 'package:flutter_messenger/core/notifier/shared_preferences_notifier.dart';
import 'package:flutter_messenger/gen/assets.gen.dart';
import 'package:flutter_messenger/src/chats/presentation/chats.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  static const String routeName = '/on-boarding';

  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final _introKey = GlobalKey<IntroductionScreenState>();

  final pages = [
    PageViewModel(
      title: 'Messenger',
      bodyWidget: Column(
        children: [
          Assets.lottie.peopleChat.lottie(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    ),
    PageViewModel(
      title: 'Messenger',
      bodyWidget: Column(
        children: [
          Assets.lottie.peopleChat.lottie(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    ),
    PageViewModel(
      title: 'Messenger',
      bodyWidget: Column(
        children: [
          Assets.lottie.peopleChat.lottie(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          key: _introKey,
          pages: pages,
          skip: const Text("Skip"),
          next: const Text("Next"),
          done:
              const Text("Done", style: TextStyle(fontWeight: FontWeight.w700)),
          onDone: () {
            goToHomePage();
          },
          onSkip: () {
            goToHomePage();
          },
          showSkipButton: true,
        ),
      ),
    );
  }

  void goToHomePage() {
    final sharedPreferencesNotifier =
        GetIt.instance<SharedPreferencesNotifier>();

    sharedPreferencesNotifier.setValue(SharedPreferencesKeys.isOnBoarded, true);
    GoRouter.of(context).go(ChatsPage.routeName);
  }
}
