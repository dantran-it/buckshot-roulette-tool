import 'package:flutter/material.dart';

class TrackerProvider extends ChangeNotifier {
  // Trạng thái số lượng đạn
  int _totalBullets = 0; // Tổng số đạn hiện tại trong băng
  int _liveBullets = 0; // Số đạn SỐNG hiện tại
  int _blankBullets = 0; // Số đạn RỖNG hiện tại

  // Getters để giao diện đọc dữ liệu
  int get totalBullets => _totalBullets;
  int get liveBullets => _liveBullets;
  int get blankBullets => _blankBullets;

  // Tính toán nhanh % đạn sống hiển thị trên màn hình
  double get livePercentage {
    if (_totalBullets == 0) return 0.0;
    return (_liveBullets / _totalBullets) * 100;
  }

  /// Khởi tạo khi nhấn chọn thanh 8 ô ở trên
  void selectTotalBullets(int count) {
    if (count < 0 || count > 8) return;
    _totalBullets = count;
    // Tự động chia đôi đạn (Ưu tiên đạn sống nếu lẻ)
    _liveBullets = (count / 2).ceil();
    _blankBullets = count - _liveBullets;
    notifyListeners();
  }

  /// --- NHÓM 1: MŨI TÊN TRONG HỘP - CHỈNH ĐẠN BAN ĐẦU (BÙ TRỪ NHAU) ---

  // Tăng rỗng -> Sống tự giảm
  void adjustBlankUp() {
    if (_blankBullets < _totalBullets && _liveBullets > 0) {
      _blankBullets++;
      _liveBullets--;
      notifyListeners();
    }
  }

  // Giảm rỗng -> Sống tự tăng
  void adjustBlankDown() {
    if (_blankBullets > 0 && _liveBullets < _totalBullets) {
      _blankBullets--;
      _liveBullets++;
      notifyListeners();
    }
  }

  // Tăng sống -> Rỗng tự giảm
  void adjustLiveUp() {
    if (_liveBullets < _totalBullets && _blankBullets > 0) {
      _liveBullets++;
      _blankBullets--;
      notifyListeners();
    }
  }

  // Giảm sống -> Rỗng tự tăng
  void adjustLiveDown() {
    if (_liveBullets > 0 && _blankBullets < _totalBullets) {
      _liveBullets--;
      _blankBullets++;
      notifyListeners();
    }
  }

  /// --- NHÓM 2: MŨI TÊN DƯỚI HỘP - BẮN ĐẠN TRONG TRẬN (TRỪ BĂNG) ---

  // Bắn ra viên rỗng -> Giảm rỗng và Giảm tổng đạn
  void shootBlank() {
    if (_blankBullets > 0 && _totalBullets > 0) {
      _blankBullets--;
      _totalBullets--;
      notifyListeners();
    }
  }

  // Bắn ra viên sống -> Giảm sống và Giảm tổng đạn
  void shootLive() {
    if (_liveBullets > 0 && _totalBullets > 0) {
      _liveBullets--;
      _totalBullets--;
      notifyListeners();
    }
  }

  /// Reset bàn về trạng thái trống
  void reset() {
    _totalBullets = 0;
    _liveBullets = 0;
    _blankBullets = 0;
    notifyListeners();
  }
}
