class Item2 {
  final String header;
  final String body;
  final bool? isExpanded;

  const Item2({
    required this.header,
    required this.body,
    this.isExpanded,
  });

  @override
  String toString() =>
      'Item(header: $header, body: $body, isExpanded: $isExpanded)';
}
