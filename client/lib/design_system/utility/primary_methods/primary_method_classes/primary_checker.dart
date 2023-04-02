class PrimaryChecker {
  const PrimaryChecker();

  /// [checkItem]이 null이면 true, 아니면 false를 반환한다.
  bool isNull(checkItem) {
    if (checkItem == null) {
      return true;
    } else {
      return false;
    }
  }

  /// [checkItem]이 null이 아니면 true, 맞으면 false를 반환한다.
  bool isNotNull(checkItem) {
    if (checkItem != null) {
      return true;
    } else {
      return false;
    }
  }

  bool isEmpty(checkItem) {
    if (checkItem == null || checkItem == "" || checkItem == '') {
      return true;
    } else {
      return false;
    }
  }

  bool isNotEmpty(checkItem) {
    if (checkItem != null && checkItem != "" && checkItem != '') {
      return true;
    } else {
      return false;
    }
  }
}