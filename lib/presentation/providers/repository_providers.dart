import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:classroom_timer/domain/repositories/class_session_repository.dart';
import 'package:classroom_timer/data/repositories/mock_class_session_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_providers.g.dart';

@riverpod
ClassSessionRepository classSessionRepository(ClassSessionRepositoryRef ref) {
  return MockClassSessionRepository();
}
