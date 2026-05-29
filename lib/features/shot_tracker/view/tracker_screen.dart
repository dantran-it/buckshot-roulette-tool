import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/tracker_provider.dart';
import 'widgets/bullet_bar.dart';
import 'widgets/counter_box.dart';
import '../../../core/constants/app_colors.dart';

class TrackerScreen extends StatelessWidget {
  const TrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TrackerProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('DEALER\'S SHOT TRACKER'),
        actions: [
          // Nút Reset nhanh góc phải màn hình
          IconButton(
            icon: const Icon(
              Icons.refresh_sharp,
              color: AppColors.rustOrange,
              size: 28,
            ),
            onPressed: () => provider.reset(),
            tooltip: 'Clear bàn',
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'CHỌN SỐ LƯỢNG ĐẠN TRONG BĂNG:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),

              // THANH TRÊN: 8 ô chọn tổng số đạn ban đầu
              const BulletBar(),

              const SizedBox(height: 32),

              // DÒNG THỐNG KÊ DUY NHẤT: % đạn sống xuất hiện tiếp theo
              Text(
                'Live round %: ${provider.livePercentage.toStringAsFixed(1)}%',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.liveRoundLight,
                  letterSpacing: 1.5,
                ),
              ),

              const Spacer(),

              // THANH DƯỚI: 2 cụm hộp điều chỉnh / Bắn đạn
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Ô BÊN TRÁI: Quản lý ĐẠN RỖNG (Màu xanh)
                  Expanded(
                    child: CounterBox(
                      title: 'ĐẠN RỖNG',
                      count: provider.blankBullets,
                      themeColor: AppColors.blankRound,
                      onIncrement: () => provider.adjustBlankUp(),
                      onDecrement: () => provider.adjustBlankDown(),
                      onShoot: () =>
                          provider.shootBlank(), // Nút bắn đạn rỗng dưới đáy
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Ô BÊN PHẢI: Quản lý ĐẠN SỐNG (Màu đỏ)
                  Expanded(
                    child: CounterBox(
                      title: 'ĐẠN SỐNG',
                      count: provider.liveBullets,
                      themeColor: AppColors.liveRound,
                      onIncrement: () => provider.adjustLiveUp(),
                      onDecrement: () => provider.adjustLiveDown(),
                      onShoot: () =>
                          provider.shootLive(), // Nút bắn đạn sống dưới đáy
                    ),
                  ),
                ],
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
