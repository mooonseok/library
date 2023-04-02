import 'package:flutter/material.dart';

/// {@category Atoms}
/// # 준비하는 화면을 나타내는 클래스
/// * **ReturnType : Widget**
///
/// ```
/// [사용 예시]
/// Progressing254Atom();
/// ```
class Progressing254Atom extends StatelessWidget {
  final Alignment alignment;
  final Color color;

  const Progressing254Atom(this.color,
      {Key? key, this.alignment = Alignment.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(color),
        color: color,
        strokeWidth: 3.0,
      ),
    );
  }
}