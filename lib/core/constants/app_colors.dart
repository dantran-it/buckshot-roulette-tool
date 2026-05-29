import 'package:flutter/material.dart';

class AppColors {
  // Màu nền chủ đạo (Mang phong cách căn phòng hầm tối của Dealer)
  static const Color background = Color(0xFF121212);
  static const Color surface = Color(0xFF1E1E1E);
  static const Color cardBg = Color(0xFF262626);

  // Màu sắc đại diện cho Đạn Sống (Live Round) - Đỏ rực nguy hiểm
  static const Color liveRound = Color(0xFFD32F2F);
  static const Color liveRoundLight = Color(0xFFFF5252);

  // Màu sắc đại diện cho Đạn Rỗng (Blank Round) - Xanh thép/Xám lạnh
  static const Color blankRound = Color(0xFF1976D2);
  static const Color blankRoundLight = Color(0xFF448AFF);

  // Màu sắc bổ trợ cho các chi tiết cơ khí, rỉ sét
  static const Color rustOrange = Color(0xFFE65100);
  static const Color metallicGrey = Color(0xFF757575);

  // Màu text
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xB3FFFFFF); // Trắng mờ 70%
}
