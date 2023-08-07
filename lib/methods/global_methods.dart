import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/sizes.dart';

generalDialog(
  BuildContext context,
  var provider,
  int index,
  String name,
  String title1,
  String subtitle1,
  String title2,
  String subtitle2,
) {
  return showDialog(
    context: context,
    builder: (context) {
      final size = MediaQuery.of(context).size;
      return Center(
        child: Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(dialogPadding),
              decoration: BoxDecoration(
                color: dialogColor,
                border:
                    Border.all(width: borderDialogWidth, color: appBarColor),
                borderRadius:
                    const BorderRadius.all(Radius.circular(borderRadiusDialog)),
              ),
              height: size.height * dialogHeigth,
              width: size.width * dialogWidth,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.height * sizeFontTitleDialog),
                    ),
                    const SizedBox(
                      height: sizedBoxDialog,
                    ),
                    Column(
                      children: [
                        Text(
                          title1,
                        ),
                        Text(
                          subtitle1,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: size.height * sizeFontDialog,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: sizedBoxDialog,
                    ),
                    Column(
                      children: [
                        Text(
                          title2,
                        ),
                        Text(
                          subtitle2,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: size.height * sizeFontDialog,
                          ),
                        ),
                      ],
                    ),
                  ]),
            )),
      );
    },
  );
}

Column columnDialog(String title, String subtitle, Size size) {
  return Column(
    children: [
      Text(title),
      Text(
        subtitle,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: size.height * sizeFontDialog),
      ),
    ],
  );
}
