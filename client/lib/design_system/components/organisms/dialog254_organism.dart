import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// {@category Organisms}
/// # 다이알로그를 생성하는 클래스
/// * [isCloseButtonExist] ; 다이알로그의 취소버튼을 나타냅니다.
/// * [titleWidget] : 타이틀 위젯을 생성합니다.
/// * [contentsWidget] : 컨텐츠 위젯을 생성합니다.
/// * [bottomWidget] : 바텀 위젯을 생성합니다.
/// * [color] : 다이알로그자체의 색상을 나타냅니다.
/// * [padding] : 다이알로그 내부 패딩값을 나타냅니다.
///
/// ```
/// [사용 예시]
/// Dialog254Organism(
///   isCloseButtonExist: true,
///   titleWidget: Container(),
///   contentsWidget: Container(),
///   bottomWidget: Container(),
///   color: Colors.white,
///   padding: const EdgeInsets.zero,
/// ),
/// ```
class Dialog254Organism extends StatelessWidget {
  final bool isCloseButtonExist;
  final Widget titleWidget;
  final Widget contentsWidget;
  final Widget bottomWidget;
  final double? height;
  final Color color;
  final bool isCenter;
  final EdgeInsetsGeometry? padding;
  final double? width;

  const Dialog254Organism({
    Key? key,
    required this.titleWidget,
    required this.contentsWidget,
    required this.bottomWidget,
    required this.color,
    this.isCloseButtonExist = false,
    this.height,
    this.padding,
    this.isCenter = true,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double radiusValue = 25;
    Widget closeButtonArea = isCloseButtonExist == true
        ? Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.close),
            ),
          )
        : const SizedBox();

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: SingleChildScrollView(
        child: Container(
          width: width ?? 63.w,
          padding: padding,
          height: height,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(radiusValue)),
            color: color,
          ),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              closeButtonArea,
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: isCenter
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    titleWidget,
                    contentsWidget,
                    bottomWidget,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
