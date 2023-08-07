import 'package:flutter/cupertino.dart';
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

Container pagination(double width, double heigth, int page, int totalPages,
    BuildContext context, Function() increment, Function() decrease) {
  return Container(
    padding: EdgeInsets.all(heigth * paddingPagination),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: width * buttonPaginationWidth,
          child: FittedBox(
            child: FloatingActionButton(
              heroTag: "btn2",
              backgroundColor: buttonColor,
              onPressed: page > 1 ? decrease : null,
              child: const Icon(
                Icons.arrow_back,
              ),
            ),
          ),
        ),
        Text('Page $page of $totalPages'),
        SizedBox(
          width: width * buttonPaginationWidth,
          child: FittedBox(
            child: FloatingActionButton(
              heroTag: "btn3",
              backgroundColor: buttonColor,
              onPressed: page < totalPages ? increment : null,
              child: const Icon(
                Icons.arrow_forward,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Positioned loading() {
  return Positioned.fill(
    child: Container(
      alignment: Alignment.center,
      color: Colors.white30,
      child: const CupertinoActivityIndicator(
        radius: 20,
      ),
    ),
  );
}
