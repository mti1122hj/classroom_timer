import 'package:classroom_timer/domain/entities/class_session_type.dart';
import 'package:classroom_timer/domain/repositories/class_session_repository.dart';

class MockClassSessionRepository implements ClassSessionRepository {
  @override
  Future<List<ClassSessionType>> getClassSessionTypes() async {
    // Simulate network/DB delay
    await Future.delayed(const Duration(milliseconds: 500));

    return [
      const ClassSessionType(
        id: 'normal_50',
        name: '通常授業 (50分)',
        totalDurationInMinutes: 50,
        sections: [
          SessionSection(id: 's1', label: '導入・出席', durationInMinutes: 5),
          SessionSection(id: 's2', label: '展開1 (講義)', durationInMinutes: 15),
          SessionSection(id: 's3', label: '展開2 (演習)', durationInMinutes: 20),
          SessionSection(id: 's4', label: 'まとめ', durationInMinutes: 10),
        ],
      ),
      const ClassSessionType(
        id: 'test_50',
        name: '定期テスト (50分)',
        totalDurationInMinutes: 50,
        sections: [
          SessionSection(id: 't1', label: '注意事項・配布', durationInMinutes: 5),
          SessionSection(id: 't2', label: '試験時間', durationInMinutes: 45),
        ],
      ),
      const ClassSessionType(
        id: 'short_45',
        name: '短縮授業 (45分)',
        totalDurationInMinutes: 45,
        sections: [
          SessionSection(id: 'sh1', label: '導入', durationInMinutes: 5),
          SessionSection(id: 'sh2', label: '展開', durationInMinutes: 35),
          SessionSection(id: 'sh3', label: 'まとめ', durationInMinutes: 5),
        ],
      ),
    ];
  }

  @override
  Stream<List<ClassSessionType>> watchClassSessionTypes() {
    return Stream.fromFuture(getClassSessionTypes());
  }

  @override
  Future<ClassSessionType?> getClassSessionTypeById(String id) async {
    final types = await getClassSessionTypes();
    try {
      return types.firstWhere((element) => element.id == id);
    } catch (_) {
      return null;
    }
  }
  @override
  Future<void> saveClassSessionType(ClassSessionType classSessionType) async {
    // Mock implementation - do nothing
  }

  @override
  Future<void> deleteClassSessionType(String id) async {
    // Mock implementation - do nothing
  }
}
