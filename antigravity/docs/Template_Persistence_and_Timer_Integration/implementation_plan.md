# 実装計画 - テンプレートの永続化とリアクティブな更新

現在の `HomePage` は `MockClassSessionRepository` からデータを取得しており、データが保存されず、変更も反映されません。これを `ClassSessionRepositoryImpl` (Isar使用) に切り替え、テンプレートの追加や変更がホーム画面に即座に反映されるようにします。

## ユーザーレビューが必要な事項

> [!IMPORTANT]
> `ClassSessionRepository` インターフェースに `Stream` を返すメソッド (`watchClassSessionTypes`) を追加します。これにより、すべてのリポジトリ実装（モック含む）の修正が必要になります。

## 提案される変更

### Domain層 (ビジネスロジック)

#### [MODIFY] [class_session_repository.dart](file:///home/mti1122hj/classroom_timer/lib/domain/repositories/class_session_repository.dart)

- `Stream<List<ClassSessionType>> watchClassSessionTypes()` メソッドをインターフェースに追加します。
- これにより、データベースの変更をリアルタイムで監視できるようになります。

### Data層 (データ実装)

#### [MODIFY] [class_session_repository_impl.dart](file:///home/mti1122hj/classroom_timer/lib/data/repositories/class_session_repository_impl.dart)

- Isar の `watch()` メソッドを使用して `watchClassSessionTypes()` を実装します。

#### [MODIFY] [mock_class_session_repository.dart](file:///home/mti1122hj/classroom_timer/lib/data/repositories/mock_class_session_repository.dart)

- テストやプレビュー用に、固定データのストリームを返すように `watchClassSessionTypes()` を実装します。

### Presentation層 (UI・状態管理)

#### [MODIFY] [repository_providers.dart](file:///home/mti1122hj/classroom_timer/lib/presentation/providers/repository_providers.dart)

- `classSessionRepositoryProvider` が `MockClassSessionRepository` ではなく、本物の `ClassSessionRepositoryImpl` を返すように変更します。
- `isarProvider` から Isar インスタンスを取得してリポジトリに渡します。

#### [NEW] [class_session_providers.dart](file:///home/mti1122hj/classroom_timer/lib/presentation/providers/class_session_providers.dart)

- テンプレート一覧の Stream を提供する `classSessionTypesStreamProvider` を作成します。

#### [MODIFY] [home_page.dart](file:///home/mti1122hj/classroom_timer/lib/presentation/pages/home_page.dart)

- `FutureBuilder` を削除し、`ref.watch(classSessionTypesStreamProvider)` を使用してデータを監視します。
- これにより、保存後にホーム画面に戻った際、自動的にリストが更新されます。

## 検証計画

### 動作確認手順

1.  アプリを起動します: `flutter run -d linux`
2.  初期状態（テンプレートなし、または初期データ）を確認します。
3.  「テンプレート作成」ボタンから編集画面へ移動します。
4.  新しいテンプレートを作成し、保存します。
5.  ホーム画面に戻り、新しいテンプレートがリストに追加されていることを確認します。
6.  アプリを再起動し、データが消えずに残っていることを確認します。
