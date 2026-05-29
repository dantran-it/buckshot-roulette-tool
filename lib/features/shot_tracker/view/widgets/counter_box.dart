import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class CounterBox extends StatelessWidget {
  final String title;
  final int count;
  final Color themeColor;
  final VoidCallback onIncrement; // Mũi tên lên điều chỉnh ban đầu
  final VoidCallback onDecrement; // Mũi tên xuống điều chỉnh ban đầu
  final VoidCallback onShoot; // Mũi tên xuống dưới gầm để trừ đạn trong băng

  const CounterBox({
    super.key,
    required this.title,
    required this.count,
    required this.themeColor,
    required this.onIncrement,
    required this.onDecrement,
    required this.onShoot,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. Khung hộp chứa bộ điều chỉnh đạn ban đầu (Theo phác thảo thiết kế)
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.surface,
            border: Border.all(color: themeColor.withOpacity(0.7), width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: themeColor,
                ),
              ),

              // Mũi tên LÊN (Điều chỉnh tăng)
              IconButton(
                icon: const Icon(Icons.arrow_drop_up, size: 40),
                color: themeColor,
                onPressed: onIncrement,
              ),

              // Số lượng đạn hiện tại
              Text(
                '$count',
                style: const TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Mũi tên XUỐNG (Điều chỉnh giảm)
              IconButton(
                icon: const Icon(Icons.arrow_drop_down, size: 40),
                color: themeColor,
                onPressed: onDecrement,
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // 2. Mũi tên xuống riêng biệt ở dưới dùng để BẮN (Trừ đạn khỏi băng)
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: themeColor.withOpacity(0.15),
            side: BorderSide(color: themeColor, width: 2),
            padding: const EdgeInsets.symmetric(vertical: 14),
            minimumSize: const Size.fromHeight(
              54,
            ), // Chiều ngang co giãn bằng hộp ở trên
          ),
          onPressed: onShoot,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.keyboard_double_arrow_down, size: 22),
              const SizedBox(width: 6),
              Text(
                'BẮN (TRỪ BĂNG)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: themeColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
