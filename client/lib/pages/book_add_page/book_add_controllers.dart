import 'package:flutter/cupertino.dart';

class BookAddControllers {
  late TextEditingController _nameController;
  late TextEditingController _authorController;
  late TextEditingController _publisherController;

  TextEditingController get nameController => _nameController;
  TextEditingController get authorController => _authorController;
  TextEditingController get publisherController => _publisherController;

  void init() {
    _nameController = TextEditingController();
    _authorController = TextEditingController();
    _publisherController = TextEditingController();
  }
}
