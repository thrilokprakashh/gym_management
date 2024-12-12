import 'package:flutter/material.dart';
import 'package:gym_management/utils/constans/color_extention.dart';

enum RoundButtonType { primary, line }

class RoundButton extends StatelessWidget {
  final String title;
  final RoundButtonType type;
  final double height;
  final double fontSize;
  final FontWeight fontWeight;
  final double width;
  final String? image;
  final bool isPadding;
  final VoidCallback onPressed;

  const RoundButton(
      {super.key,
      required this.title,
      this.type = RoundButtonType.primary,
      this.height = 50,
      this.fontSize = 14,
      this.fontWeight = FontWeight.w600,
      this.width = double.maxFinite,
      this.isPadding = true,
      required this.onPressed,
      this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: isPadding ? 20 : 0),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: width,
        decoration: BoxDecoration(
          color:
              type == RoundButtonType.primary ? TColor.primary : TColor.txtBG,
          border: type == RoundButtonType.line
              ? Border.all(color: TColor.board)
              : null,
          borderRadius: BorderRadius.circular(25),
        ),
        height: height,
        child: Row(
          children: [
            if (image != null)
              SizedBox(
                width: 60,
                child: Image.asset(
                  image!,
                  height: 20,
                  width: 20,
                ),
              ),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: type == RoundButtonType.primary
                        ? TColor.btnPrimaryText
                        : TColor.btnSecondaryText,
                    fontSize: fontSize,
                    fontWeight: fontWeight),
              ),
            ),
            if (image != null)
              Container(
                width: 60,
              ),
          ],
        ),
      ),
    );
  }
}
