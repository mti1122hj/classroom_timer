# プロジェクト基盤構築・アーキテクチャ整理

## 目標

`SPECIFICATION.md` に基づき、Flutterプロジェクトに最適なライブラリを導入し、Clean Architectureに沿ったディレクトリ構成を構築する。

## ユーザーレビューが必要な事項

- 特になし

## 変更内容

### 依存関係 (pubspec.yaml)

以下のパッケージを追加・設定する。

#### Core & Architecture

- **`flutter_riverpod` / `riverpod_annotation`**
  - **用途**: アプリ全体の状態管理（State Management）と依存性注入（DI）。
  - **理由**: テストが書きやすく、安全に状態を管理できるため、仕様書で指定されています。

#### Database

- **`isar` / `isar_flutter_libs`**
  - **用途**: アプリ内データの保存（テンプレート、授業ログなど）。
  - **対応**: iOS / Android 両対応。
  - **理由**: 高速かつスキーマ定義が容易なNoSQLデータベースであり、完全にオフラインで動作するため。

#### Notification

- **`flutter_local_notifications`**
  - **用途**:
    - **タイマー終了時の通知**: バックグラウンドにいてもユーザーに知らせるため。
    - **ロック画面での操作**: 通知にアクションボタン（「次へ」「巻き」など）を追加し、アプリを開かずに操作できるようにするため。
  - **対応**: **iOS / Android 両対応**。
    - ただし、OSごとの設定（権限リクエストや通知カテゴリの登録）がそれぞれ必要です。
    - Androidは細かいカスタマイズが可能ですが、iOSはOSの制約上、通知アクションの挙動に一部制限がある場合があります（基本的なボタン表示は可能です）。

#### Code Generation (Dev Dependencies)

- **`build_runner`**: コード生成コマンドを実行するためのツール。
- **`riverpod_generator`**: Riverpodのコードを自動生成し、記述量を減らす。
- **`isar_generator`**: Isarのデータベースモデル（スキーマ）を自動生成する。

### ディレクトリ構成 (lib/)

`SPECIFICATION.md` の指示通り、以下の構造を作成する。

- `lib/core/`
- `lib/domain/` (entities, usecases, repositories)
- `lib/data/` (models, datasources, repositories)
- `lib/presentation/` (providers, widgets, pages)

## 検証計画

- `flutter pub get` がエラーなく完了すること。
- 作成したディレクトリ構造が正しいことを確認。
- アプリがビルド・起動できることを確認 (Hello Worldレベルでも可)。
