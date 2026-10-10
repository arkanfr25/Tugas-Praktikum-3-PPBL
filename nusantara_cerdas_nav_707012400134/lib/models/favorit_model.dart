
import 'package:flutter/foundation.dart';

class FavoritModel extends ChangeNotifier {
  final List<String> _layananFavorit = [];

  List<String> get layananFavorit =>
      List.unmodifiable(_layananFavorit);

  bool isFavorit(String namaLayanan) {
    return _layananFavorit.contains(namaLayanan);
  }

  void tandai(String namaLayanan) {
    if (_layananFavorit.contains(namaLayanan)) return;
    _layananFavorit.add(namaLayanan);
    notifyListeners();
  }

  void batalTandai(String namaLayanan) {
    if (!_layananFavorit.contains(namaLayanan)) return;
    _layananFavorit.remove(namaLayanan);
    notifyListeners();
  }
}
