import 'dart:io';

import 'package:classroom_timer/data/models/classroom_timer_model.dart';
import 'package:classroom_timer/data/repositories/timer_repository_impl.dart';
import 'package:classroom_timer/domain/entities/classroom_timer.dart';
import 'package:classroom_timer/domain/entities/phase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';

void main() {
  late Isar isar;
  late TimerRepositoryImpl repository;

  setUp(() async {
    // initializeIsarCoreは通常自動で行われるが、テスト環境では明示が必要な場合も。
    // ここではIsar.openで一時ディレクトリを使う。
    final dir = Directory.systemTemp.createTempSync();
    
    // Isar.openはテストごとに新しいインスタンスを作るか、全テストで共有して都度clearするか。
    // ここではテストごとに作成し、tearDownで閉じる。
    await Isar.initializeIsarCore(download: true);
    isar = await Isar.open(
      [ClassroomTimerModelSchema],
      directory: dir.path,
    );
    repository = TimerRepositoryImpl(isar);
  });

  tearDown(() async {
    await isar.close(deleteFromDisk: true);
  });

  group('TimerRepositoryImpl', () {
    test('saveTimer and getTimer', () async {
      final timer = ClassroomTimer(
        id: '1',
        title: 'Test Timer',
        totalDurationMinutes: 60,
        phases: [
          const Phase(id: 'p1', title: 'Phase 1', durationMinutes: 10, sortOrder: 0),
          const Phase(id: 'p2', title: 'Phase 2', durationMinutes: 50, sortOrder: 1),
        ],
      );

      await repository.saveTimer(timer);

      final fetched = await repository.getTimer('1');
      expect(fetched, isNotNull);
      expect(fetched!.id, timer.id);
      expect(fetched.title, timer.title);
      expect(fetched.phases.length, 2);
      expect(fetched.phases[0].title, 'Phase 1');
    });

    test('deleteTimer', () async {
      final timer = ClassroomTimer(
        id: '1',
        title: 'ToDelete',
        totalDurationMinutes: 10,
        phases: [],
      );

      await repository.saveTimer(timer);
      await repository.deleteTimer('1');

      final fetched = await repository.getTimer('1');
      expect(fetched, isNull);
    });
  });
}
