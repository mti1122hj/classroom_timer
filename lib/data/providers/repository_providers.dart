import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/providers/isar_provider.dart';
import '../../domain/repositories/timer_repository.dart';
import '../repositories/timer_repository_impl.dart';

part 'repository_providers.g.dart';

@Riverpod(keepAlive: true)
TimerRepository timerRepository(Ref ref) {
  final isar = ref.watch(isarProvider);
  return TimerRepositoryImpl(isar);
}
