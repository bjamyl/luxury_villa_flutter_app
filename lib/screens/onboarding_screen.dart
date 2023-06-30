import 'package:flutter/material.dart';
import '../constants.dart';
import '../dummy_data.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_button.dart';
import '../screens/tabs_screen.dart';
import '../screens/home.dart';
import '../screens/signin_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 10),
          child: Row(
              children: List.generate(ONBOARDING_DATA.length,
                  (index) => buildDots(index, context))),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 25),
                child: Text(
                  'SKIP',
                  style: TextStyle(
                      color: kDarkColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
      body: PageView.builder(
          controller: _controller,
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemCount: ONBOARDING_DATA.length,
          itemBuilder: (ctx, i) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.all(0),
                        child: Image.asset(
                          ONBOARDING_DATA[i].imageDir,
                          height: size.height * 0.3,
                          fit: BoxFit.cover,
                        )),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Text(
                      ONBOARDING_DATA[i].title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 9, horizontal: 64),
                      child: Text(
                        ONBOARDING_DATA[i].description,
                        style: const TextStyle(
                            color: Color.fromRGBO(136, 136, 136, 1)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          currentIndex == 0
                              ? const SizedBox()
                              : MyButton(
                                  color: kDarkColor,
                                  icon: Icons.arrow_back,
                                  setPage: () {
                                    _controller?.previousPage(
                                        duration:
                                            const Duration(microseconds: 100),
                                        curve: Curves.decelerate);
                                  },
                                ),
                          currentIndex == 2
                              ? GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(TabsScreen.routeName);
                                  },
                                  child: const CustomTextButton(
                                      buttonText: 'Get Started',
                                      icon: Icons.arrow_forward,
                                      color: kPrimaryColor),
                                )
                              : MyButton(
                                  color: kPrimaryColor,
                                  icon: Icons.arrow_forward,
                                  setPage: () {
                                    _controller?.nextPage(
                                        duration:
                                            const Duration(microseconds: 100),
                                        curve: Curves.easeInOut);
                                  },
                                ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            );
          }),
    );
  }

  Container buildDots(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      height: 12,
      width: currentIndex == index ? 36 : 12,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: currentIndex == index
              ? kPrimaryColor
              : const Color.fromRGBO(12, 36, 62, 0.2)),
    );
  }
}
