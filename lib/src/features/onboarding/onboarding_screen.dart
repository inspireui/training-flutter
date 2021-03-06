import 'package:flutter/material.dart';
import 'package:flutter_train_session3/src/features/factory.dart';

import '../sign_up/sign_up_screen.dart';
import '../../components/widgets/mybutton_social.dart';
import '../../constants.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  void _onTapGetStart() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
          builder: (BuildContext context) =>
              FeatureFactory.create<SignUpScreen>()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 126, bottom: 70),
              child: Image.asset(
                imgOnboarding1,
                width: 236,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: Text(
                'Enjoy The New Arrival Product',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20.0,
                bottom: 107,
                left: 45,
                right: 45,
              ),
              child: Text(
                'Get your dream item easily and safely with Shoesly. and get other interesting offers',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30)
                  .copyWith(bottom: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _onTapGetStart,
                  child: Text(
                    'Get Started'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: const [
                  Expanded(
                      child: MyButtonSocial(
                    icon: icGoogle,
                    text: 'Google',
                  )),
                  SizedBox(width: 15),
                  Expanded(
                      child: MyButtonSocial(
                    icon: icFacebook,
                    text: 'Facebook',
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
