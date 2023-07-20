// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:shamo_mobile/theme.dart';

Widget InputCostumWidget(
  String title,
  String hintText,
  String icon,
  TextEditingController controller, {
  double bottom = 0,
  bool obscureText = false,
}) {
  return Container(
    margin: EdgeInsets.only(bottom: bottom),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: primaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: bgColor2,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Row(
              children: [
                Image.asset(
                  icon,
                  width: 17,
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    obscureText: obscureText,
                    decoration: InputDecoration.collapsed(
                      hintText: hintText,
                      hintStyle: subtitleTextStyle,
                    ),
                    style: primaryTextStyle,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget buttonComp(label, onPressed, {isLoading = false}) {
  return Container(
    height: 50,
    width: double.infinity,
    child: TextButton(
      onPressed: () => {!isLoading ? onPressed() : null},
      style: TextButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isLoading
              ? Row(
                  children: [
                    Container(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation(primaryTextColor),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    )
                  ],
                )
              : Container(),
          Text(
            isLoading ? "Loading" : label,
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget header({title, subTitle}) {
  return Container(
    margin: EdgeInsets.only(top: defaultMargin),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: primaryTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
        SizedBox(height: 2),
        Text(
          subTitle,
          style: subtitleTextStyle,
        ),
        SizedBox(height: 2),
      ],
    ),
  );
}

Widget footer(context, title, labelAction, route) {
  return Container(
    margin: EdgeInsets.only(bottom: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: subtitleTextStyle.copyWith(fontSize: 12),
        ),
        GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(context, route),
          child: Text(
            labelAction,
            style: purpleTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium,
            ),
          ),
        )
      ],
    ),
  );
}
