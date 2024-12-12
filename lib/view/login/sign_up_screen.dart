import 'package:flutter/material.dart';
import 'package:gym_management/utils/constans/color_extention.dart';
import 'package:gym_management/utils/constans/image_constans.dart';
import 'package:gym_management/utils/widgets/round_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              ImageConstans.splashScreenLogo,
              width: context.width * 0.7,
            ),
            const SizedBox(
              height: 100,
            ),
            RoundButton(
              title: "Mobile Number",
              type: RoundButtonType.line,
              fontWeight: FontWeight.normal,
              isPadding: false,
              image: ImageConstans.phone,
              onPressed: () {},
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 36,
                      decoration: BoxDecoration(
                        color: Color(0xff3A91F7),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            ImageConstans.fb,
                            width: 12,
                            height: 12,
                          ),
                          const Expanded(
                            child: Text(
                              "Facebook",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 36,
                      decoration: BoxDecoration(
                        color: TColor.txtBG,
                        border: Border.all(color: TColor.board, width: 1),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            ImageConstans.google,
                            width: 12,
                            height: 12,
                          ),
                          Expanded(
                            child: Text(
                              "Google",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: TColor.primaryText, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
