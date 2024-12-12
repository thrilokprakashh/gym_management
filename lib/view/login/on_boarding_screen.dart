import 'package:flutter/material.dart';
import 'package:gym_management/utils/constans/color_extention.dart';
import 'package:gym_management/utils/constans/image_constans.dart';
import 'package:gym_management/utils/widgets/round_button.dart';
import 'package:gym_management/view/login/sign_up_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int selectPage = 0;
  PageController controller = PageController();
  List pageArr = [
    {
      "title": "Exercises",
      "subtitle": "To your Personalized Profile",
      "image": ImageConstans.pageOne,
    },
    {
      "title": "Keep Eye On Health\nTracking",
      "subtitle": "Log & reminder your activities",
      "image": ImageConstans.pageTwo,
    },
    {
      "title": "Check Your Progress",
      "subtitle": "An Tracking Calendar",
      "image": ImageConstans.pageThree,
    }
  ];
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        selectPage = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            alignment: Alignment.center,
            child: RoundButton(
              title: "Skip",
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpScreen(),
                  ),
                  (route) => false,
                );
              },
              height: 30,
              fontSize: 12,
              width: 70,
              fontWeight: FontWeight.w300,
              type: RoundButtonType.line,
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: pageArr.length,
            itemBuilder: (context, index) {
              var pObj = pageArr[index] as Map? ?? {};
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Spacer(),
                  Text(
                    pObj["title"].toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    pObj["subtitle"].toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 15,
                    ),
                  ),
                  Container(
                    width: context.width,
                    height: context.width,
                    alignment: Alignment.center,
                    child: Image.asset(
                      pObj["image"],
                      width: context.width * 0.65,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              );
            },
          ),
          SafeArea(
            child: Column(
              children: [
                const Spacer(
                  flex: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pageArr.map((e) {
                    var index = pageArr.indexOf(e);
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: index == selectPage
                            ? TColor.primary
                            : TColor.inactive,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    );
                  }).toList(),
                ),
                const Spacer(),
                RoundButton(
                  title: "Next",
                  width: 150,
                  onPressed: () {
                    if (selectPage >= 2) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                        (route) => false,
                      );
                    } else {
                      selectPage = selectPage + 1;
                      controller.animateToPage(selectPage,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.fastOutSlowIn);
                    }
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
