class Coupon {
  final String id;
  final String title;
  final String discount; // Can be "15%" or "₹6,900"
  final String description;
  final bool isApplied;
  final String type; // "applied", "more", "payment"

  Coupon({
    required this.id,
    required this.title,
    required this.discount,
    required this.description,
    required this.isApplied,
    required this.type,
  });
}

