class UpdateBookDTO {
  final int id;
  final String? borrower;

  UpdateBookDTO({
    required this.id,
    this.borrower,
  });
}
