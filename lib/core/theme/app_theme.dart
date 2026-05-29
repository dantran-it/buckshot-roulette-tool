import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // Cấu hình màu nền ứng dụng
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        surface: AppColors.surface,
        primary: AppColors.liveRound,
        secondary: AppColors.blankRound,
      ),

      // Cấu hình AppBar (Thanh tiêu đề phía trên)
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.rustOrange,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0, // Giãn chữ nhìn cho "nguy hiểm"
        ),
      ),

      // Cấu hình các loại Thẻ (Card) hiển thị số lượng
      cardTheme: CardThemeData(
        color: AppColors.cardBg,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4), // Góc vuông vắn, gai góc hơn
          side: const BorderSide(color: AppColors.metallicGrey, width: 1),
        ),
      ),

      // Cấu hình nút bấm (Ví dụ nút mũi tên hoặc nút reset)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.surface,
          foregroundColor: AppColors.textPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
      ),

      // Cấu hình định dạng chữ chung (Text Theme)
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 32,
          fontWeight: FontWeight.w900,
        ),
        bodyLarge: TextStyle(color: AppColors.textPrimary, fontSize: 16),
        bodyMedium: TextStyle(color: AppColors.textSecondary, fontSize: 14),
      ),
    );
  }
}
