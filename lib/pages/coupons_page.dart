import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/coupon.dart';
import '../widgets/coupon_card.dart';

class CouponsPage extends StatefulWidget {
  const CouponsPage({super.key});

  @override
  State<CouponsPage> createState() => _CouponsPageState();
}

class _CouponsPageState extends State<CouponsPage> {
  // Sample coupon data
  final List<Coupon> appliedCoupons = [
    Coupon(
      id: '1',
      title: 'LONGSTAY',
      discount: '15%',
      description:
          '15% off when you book for 5 days or more and 20% off when you book for 30 days or more.',
      isApplied: true,
      type: 'applied',
    ),
  ];

  final List<Coupon> moreCoupons = [
    Coupon(
      id: '2',
      title: 'LONGSTAY',
      discount: '₹6,900',
      description:
          '15% off when you book for 5 days or more and 20% off when you book for 30 days or more.',
      isApplied: false,
      type: 'more',
    ),
    Coupon(
      id: '3',
      title: 'LONGSTAY',
      discount: '₹6,900',
      description:
          '15% off when you book for 5 days or more and 20% off when you book for 30 days or more.',
      isApplied: false,
      type: 'more',
    ),
  ];

  final List<Coupon> paymentOffers = [
    Coupon(
      id: '4',
      title: 'LONGSTAY',
      discount: '₹6,900',
      description:
          '15% off when you book for 5 days or more and 20% off when you book for 30 days or more.',
      isApplied: false,
      type: 'payment',
    ),
    Coupon(
      id: '5',
      title: 'LONGSTAY',
      discount: '₹6,900',
      description:
          '15% off when you book for 5 days or more and 20% off when you book for 30 days or more.',
      isApplied: false,
      type: 'payment',
    ),
  ];

  void _showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.lexendDeca(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        backgroundColor: const Color(0xFF316836), // success color
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _handleRemove(Coupon coupon) {
    setState(() {
      appliedCoupons.removeWhere((c) => c.id == coupon.id);
    });
    _showSuccessMessage('Coupon removed successfully!');
  }

  void _handleApply(Coupon coupon) {
    _showSuccessMessage('Coupon applied successfully!');
  }

  void _handleReadMore(Coupon coupon) {
    _showSuccessMessage('Read more clicked for ${coupon.title}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        bottom: false,
        child: Column(
          children: [
            // Status bar - exact Figma design
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10), // padding/600, padding/250
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '9:30',
                    style: GoogleFonts.figtree(
                      fontSize: 14,
                      fontWeight: FontWeight.w400, // Regular
                      color: const Color(0xFF646864), // icon color
                      height: 1.43, // 20px line height
                      letterSpacing: 0,
                    ),
                  ),
                  Row(
                    children: [
                      // WiFi icon - 17px
                      SizedBox(
                        width: 17,
                        height: 17,
                        child: Image.network(
                          'https://www.figma.com/api/mcp/asset/4a974ea2-fe45-4f85-b5e0-f092cd2692ed',
                          width: 17,
                          height: 17,
                          color: const Color(0xFF646864),
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.wifi, size: 17, color: const Color(0xFF646864));
                          },
                        ),
                      ),
                      const SizedBox(width: 4),
                      // Signal icon - 17px
                      SizedBox(
                        width: 17,
                        height: 17,
                        child: Image.network(
                          'https://www.figma.com/api/mcp/asset/a836e3f2-ccf7-4714-895a-bb87716ab036',
                          width: 17,
                          height: 17,
                          color: const Color(0xFF646864),
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.signal_cellular_4_bar, size: 17, color: const Color(0xFF646864));
                          },
                        ),
                      ),
                      const SizedBox(width: 4),
                      // Battery icon - 8px width, 15px height
                      SizedBox(
                        width: 8,
                        height: 15,
                        child: Image.network(
                          'https://www.figma.com/api/mcp/asset/a9931783-bb4a-45e8-9ff6-19209eee6fe0',
                          width: 8,
                          height: 15,
                          color: const Color(0xFF646864),
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.battery_full, size: 15, color: const Color(0xFF646864));
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Top App Bar with logo - exact Figma design
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFE5E6E5),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo section - exact Figma design
                  Row(
                    children: [
                      // Logo icon - aspect ratio 516/480
                      SizedBox(
                        width: 24,
                        height: 22.3, // maintaining aspect ratio
                        child: Image.network(
                          'https://www.figma.com/api/mcp/asset/8d52641d-9248-4953-9487-e79d1f99842c',
                          width: 24,
                          height: 22.3,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 24,
                              height: 22.3,
                              decoration: BoxDecoration(
                                color: const Color(0xFFC16B3E),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Icon(
                                Icons.home,
                                size: 16,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 6), // padding/150
                      // SPACEZ text with exact styling
                      Padding(
                        padding: const EdgeInsets.only(bottom: 1), // padding/25
                        child: Text(
                          'SPACEZ',
                          style: GoogleFonts.kalnia(
                            fontSize: 22,
                            fontWeight: FontWeight.w500, // Medium
                            color: const Color(0xFFC16B3E), // brown color
                            letterSpacing: -1.25, // logo/small/letter-spacing
                            height: 3.18, // 70px line height
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Menu icon - exact Figma design
                  GestureDetector(
                    onTap: () {
                      _showSuccessMessage('Menu button clicked');
                    },
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.network(
                        'https://www.figma.com/api/mcp/asset/aa9add0a-4a35-4b70-b0cd-a674dea691ce',
                        width: 24,
                        height: 24,
                        color: const Color(0xFF9A5632), // icon-brand color
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.menu,
                            size: 24,
                            color: Color(0xFF9A5632),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Header section with back button
            Container(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 7,
                    offset: const Offset(0, 2),
                  ),
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.01),
                    blurRadius: 17,
                    offset: const Offset(0, 7),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Back button - exact Figma design
                  GestureDetector(
                    onTap: () {
                      _showSuccessMessage('Back button clicked');
                      Navigator.of(context).pop();
                    },
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.network(
                        'https://www.figma.com/api/mcp/asset/f933176d-cc00-4c64-adc6-4ba1f2255774',
                        width: 24,
                        height: 24,
                        color: const Color(0xFF646864), // icon color
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.arrow_back,
                            size: 24,
                            color: Color(0xFF646864),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Coupons',
                      style: GoogleFonts.lexendDeca(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF4B4E4B), // text
                        height: 1.4, // 28px line height
                        letterSpacing: -0.25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Content sections
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Applied coupons section
                    if (appliedCoupons.isNotEmpty) ...[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                        child: Text(
                          'Applied coupons:',
                          style: GoogleFonts.lexendDeca(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF4B4E4B), // text
                            height: 1.375, // 22px line height
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: appliedCoupons.map((coupon) {
                            return CouponCard(
                              coupon: coupon,
                              onRemove: () => _handleRemove(coupon),
                              onReadMore: () => _handleReadMore(coupon),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                    // More coupons section
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                      child: Text(
                        'More coupons:',
                        style: GoogleFonts.lexendDeca(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF4B4E4B), // text
                          height: 1.375, // 22px line height
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: moreCoupons.map((coupon) {
                          return CouponCard(
                            coupon: coupon,
                            onApply: () => _handleApply(coupon),
                            onReadMore: () => _handleReadMore(coupon),
                          );
                        }).toList(),
                      ),
                    ),
                    // Payment offers section
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                      child: Text(
                        'Payment offers:',
                        style: GoogleFonts.lexendDeca(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF4B4E4B), // text
                          height: 1.375, // 22px line height
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: paymentOffers.map((coupon) {
                          return CouponCard(
                            coupon: coupon,
                            onApply: () => _handleApply(coupon),
                            onReadMore: () => _handleReadMore(coupon),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 100), // Space for bottom bar
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // Bottom reservation bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Green offer banner - exact color #316836
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), // padding/250, padding/100
              decoration: const BoxDecoration(
                color: Color(0xFF316836), // background-surface-success-prominent
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.local_offer,
                    size: 20,
                    color: Color(0xFFFFFFFF), // text-inverse
                  ),
                  const SizedBox(width: 8), // gap
                  Text(
                    'Book now & Unlock exclusive rewards!',
                    style: GoogleFonts.lexendDeca(
                      fontSize: 14,
                      fontWeight: FontWeight.w400, // Regular 326
                      color: const Color(0xFFFFFFFF), // text-inverse
                      height: 1.43, // 20px line height
                      letterSpacing: 0,
                    ),
                  ),
                ],
              ),
            ),
            // Price and reserve section - exact padding/500 (20px), padding/400 (16px)
            Container(
              padding: const EdgeInsets.all(20), // padding/500
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '₹ 19,500',
                              style: GoogleFonts.figtree(
                                fontSize: 12,
                                fontWeight: FontWeight.w400, // Regular 460
                                color: const Color(0xFFB82B14), // text-critical
                                decoration: TextDecoration.lineThrough,
                                height: 1.5, // 18px line height
                                letterSpacing: 0,
                              ),
                            ),
                            const SizedBox(width: 6), // padding/150
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '₹16,000',
                                  style: GoogleFonts.figtree(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700, // Regular 741
                                    color: const Color(0xFF4B4E4B), // text
                                    height: 1.33, // 24px line height
                                    letterSpacing: 0,
                                  ),
                                ),
                                const SizedBox(width: 2), // padding/50
                                Text(
                                  'for 2 nights',
                                  style: GoogleFonts.lexendDeca(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400, // Regular 326
                                    color: const Color(0xFF7D817D), // text-secondary
                                    height: 1.43, // 20px line height
                                    letterSpacing: 0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 4), // padding/100
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '24 Apr - 26 Apr | 8 guests',
                                style: GoogleFonts.lexendDeca(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400, // Regular 326
                                  color: const Color(0xFF4B4E4B), // text
                                  height: 1.5, // 18px line height
                                  decoration: TextDecoration.underline,
                                  letterSpacing: 0,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5), // gap
                            GestureDetector(
                              onTap: () {
                                _showSuccessMessage('Edit button clicked');
                              },
                              child: const Icon(
                                Icons.edit_outlined,
                                size: 15,
                                color: Color(0xFF646864), // icon
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16), // spacing
                  GestureDetector(
                    onTap: () {
                      _showSuccessMessage('Reserve button clicked');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16, // padding/400
                        vertical: 8, // padding/200
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFC16B3E), // background-surface-brown-prominent
                        borderRadius: BorderRadius.circular(2), // corner/small
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 100,
                        minHeight: 40,
                      ),
                      child: Center(
                        child: Text(
                          'Reserve',
                          style: GoogleFonts.lexendDeca(
                            fontSize: 16,
                            fontWeight: FontWeight.w400, // Regular 326
                            color: const Color(0xFFFFFFFF), // text-inverse
                            height: 1.5, // 24px line height
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Bottom navigation handle
            Container(
              height: 24,
              alignment: Alignment.center,
              child: Container(
                width: 108,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFF646864), // icon
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

