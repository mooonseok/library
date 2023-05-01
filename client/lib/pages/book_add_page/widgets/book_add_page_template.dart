import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BookAddPageTemplate extends StatelessWidget {
  final Widget contents;
  final Widget bottomButton;
  const BookAddPageTemplate({
    super.key,
    required this.contents,
    required this.bottomButton,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: SizedBox(
              height: 80.h,
              child: Column(
                children: [
                  Expanded(
                    flex: 13,
                    child: contents,
                  ),
                  Expanded(
                    flex: 1,
                    child: bottomButton,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
