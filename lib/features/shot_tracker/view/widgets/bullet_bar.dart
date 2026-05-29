import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/tracker_provider.dart';
import '../../../../core/constants/app_colors.dart';

class BulletBar extends StatelessWidget {
  const BulletBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Lắng nghe dữ liệu từ TrackerProvider
    final provider = context.watch<TrackerProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(8, (index) {
        // Vị trí thực tế của ô đạn (từ 1 đến 8)
        int bulletNumber = index + 1;
        // Ô này có đang được kích hoạt bôi đỏ hay không
        bool isSelected = bulletNumber <= provider.totalBullets;

        return Expanded(
          child: GestureDetector(
            onTap: () => provider.selectTotalBullets(bulletNumber),
            child: Container(
              height: 70,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                // Nếu được chọn: Đổ màu đỏ rực. Nếu không: Để nền tối viền xám rỉ sét
                color: isSelected ? AppColors.liveRound : AppColors.surface,
                border: Border.all(
                  color: isSelected
                      ? AppColors.liveRoundLight
                      : AppColors.metallicGrey,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(6),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: AppColors.liveRound.withOpacity(0.5),
                          blurRadius: 8,
                        ),
                      ]
                    : [],
              ),
              child: Center(
                child: Text(
                  '$bulletNumber',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isSelected
                        ? AppColors.textPrimary
                        : AppColors.textSecondary,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
