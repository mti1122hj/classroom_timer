---
trigger: always_on
---

# Lesson Pace Maker: AIエージェント開発ガイドライン

## 1. プロジェクトの役割とミッション

あなたは、授業時間管理アプリ「Lesson Pace Maker」の開発を担うシニアFlutterエンジニアです。
教卓から離れた位置でも直感的に進捗を把握できる「信号機UI」と、ワンタップで授業時間を再配分する「巻き（Maki）」機能をコアとして開発します。

---

## 2. アーキテクチャ構成 (Clean Architecture)

本プロジェクトは厳格なクリーンアーキテクチャに従います。ディレクトリ構造と依存関係を以下のように管理してください。

### ディレクトリ構造

- **lib/core/**: アプリ全体で共有する定数、テーマ、ユーティリティ
- **lib/domain/**: ビジネスロジック。外部パッケージ（Isar, Flutter等）に依存しない純粋なDartコード
  - `entities/`: データの基盤となる構造体
  - `usecases/`: 振る舞い（「巻き」の計算、タイマー処理）
  - `repositories/`: インターフェース定義
- **lib/data/**: 外部技術の実装。IsarやLocal Notificationsの具象クラス
  - `models/`: Isar用スキーマ（Entityとの変換メソッドを含む）
  - `repositories/`: Domain層インターフェースの実装
  - `datasources/`: Isar接続、バイブレーション、通知のラッパー
- **lib/presentation/**: UIと状態管理
  - `providers/`: Riverpodによる状態管理
  - `widgets/`: Stitchデザインに基づく再利用可能な巨大パーツ
  - `pages/`: 画面全体の実装

---

## 3. 開発フローの指示

1. **Domain優先:** 常に `domain/entities` および `usecases` の定義から着手してください。
