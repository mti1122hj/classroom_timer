import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

// Isarインスタンスを提供するProvider
// main関数で await Isar.open() したものを override して使うことを想定
// 初期値は UnimplementedError を投げるようにして、override忘れを防ぐ
final isarProvider = Provider<Isar>((ref) {
  throw UnimplementedError('isarProvider must be overridden in main.dart');
});
