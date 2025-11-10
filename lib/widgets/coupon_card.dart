import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/coupon.dart';
import 'dashed_border.dart';

class CouponCard extends StatelessWidget {
  final Coupon coupon;
  final VoidCallback? onRemove;
  final VoidCallback? onApply;
  final VoidCallback? onReadMore;

  const CouponCard({
    super.key,
    required this.coupon,
    this.onRemove,
    this.onApply,
    this.onReadMore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 184,
      child: Row(
        children: [
          // Discount section (left side) - exact color #c16b3e
          Container(
            width: 80,
            decoration: const BoxDecoration(
              color: Color(0xFFC16B3E), // background-surface-brown-prominent
              borderRadius: BorderRadius.only(
            
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20), // padding/300, padding/500
            child: Center(
              child: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  coupon.discount,
                  style: GoogleFonts.libreCaslonText(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFFFFFFF), // text-inverse
                    height: 1.375, // 44px line height
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
          ),
          // Coupon content section (right side) with dashed border
          Expanded(
            child: DashedBorder(
              color: const Color(0xFFAD6038), // border-brand-prominent
              strokeWidth: 2, // border/50
              dashWidth: 6,
              dashSpace: 4,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFDF9F7), // background-surface-brown
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(20, 20, 16, 16), // padding/500, padding/400
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title and action button row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            coupon.title,
                            style: GoogleFonts.lexendDeca(
                              fontSize: 18,
                              fontWeight: FontWeight.w600, // SemiBold 634
                              color: const Color(0xFF4B4E4B), // text
                              height: 1.33, // 24px line height
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6), // padding/150
                        GestureDetector(
                          onTap: coupon.isApplied ? onRemove : onApply,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                coupon.isApplied
                                    ? Icons.close
                                    : Icons.shopping_bag_outlined,
                                size: 18,
                                color: const Color(0xFF874B2C), // text-brand
                              ),
                              const SizedBox(width: 6), // padding/150
                              Text(
                                coupon.isApplied ? 'Remove' : 'Apply',
                                style: GoogleFonts.lexendDeca(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500, // Medium 634
                                  color: const Color(0xFF874B2C), // text-brand
                                  height: 1.375, // 22px line height
                                  letterSpacing: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10), // padding/250
                    // Description
                    Expanded(
                      child: Text(
                        coupon.description,
                        style: GoogleFonts.lexendDeca(
                          fontSize: 14,
                          fontWeight: FontWeight.w400, // Regular 326
                          color: const Color(0xFF7D817D), // text-secondary
                          height: 1.43, // 20px line height
                          letterSpacing: 0,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Divider
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFE5E6E5), // border
                    ),
                    const SizedBox(height: 4), // padding/100
                    // Read more button
                    GestureDetector(
                      onTap: onReadMore,
                      child: Text(
                        'Read more',
                        style: GoogleFonts.lexendDeca(
                          fontSize: 14,
                          fontWeight: FontWeight.w600, // SemiBold 634
                          color: const Color(0xFF7D817D), // text-secondary
                          height: 1.43, // 20px line height
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
