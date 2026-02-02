---
name: design-with-stitch
description: Stitchからデザインを取得し、Flutter UIを実装するためのスキル
---

# Design with Stitch

このスキルは、Google Stitchの機能を活用して、デザインの参照・生成を行いながらFlutterアプリケーションのUIを効率的に実装するためのガイドラインです。

## 利用可能なツール (MCP Stitch Server)

以下のツールを活用して、デザイン情報にアクセスします。

- `mcp_stitch_list_projects`: プロジェクト一覧を取得します。
- `mcp_stitch_get_project`: プロジェクトの詳細を取得します。
- `mcp_stitch_list_screens`: プロジェクト内の画面一覧を取得します。
- `mcp_stitch_get_screen`: 特定の画面の詳細情報（コンポーネント構成など）を取得します。
- `mcp_stitch_generate_screen_from_text`: テキストプロンプトから新しい画面デザインを生成します。
- `mcp_stitch_create_project`: 新規プロジェクトを作成します。

## ワークフロー

### 1. プロジェクトの確認

まず、作業対象のStitchプロジェクトを特定します。

```bash
# プロジェクト一覧を確認
mcp_stitch_list_projects(filter="view=owned")
```

対象の `project_id`: **`projects/17251198196941149112`** (授業時間管理タイマー)

このプロジェクトIDを使用して、以降のステップを進めます。

### 2. スクリーンの探索と詳細取得

実装する機能に対応する画面デザインを探します。

```bash
# 画面一覧を取得
mcp_stitch_list_screens(projectId="projects/17251198196941149112")
```

該当するスクリーンが見つかったら、その詳細を取得してデザイン要素を確認します。

```bash
# 画面詳細を取得
mcp_stitch_get_screen(projectId="projects/17251198196941149112", screenId="{screen_id}")
```

**デザインが存在しない場合:**
`mcp_stitch_generate_screen_from_text` を使用して、仕様に基づいたラフデザインを生成することを検討してください。

例:

> "信号機のような配色（緑、黄、赤）を使った、教室の教壇からでも見やすい巨大な残り時間タイマー画面。"

### 3. Flutter実装への落とし込み

取得したデザイン情報を元に、Clean Architectureに沿って実装します。

1.  **コンポーネントの分析**:
    - 画面全体で共通して使えそうな部品（ボタン、カード、ヘッダー等）を `lib/presentation/widgets/` に切り出します。
    - 特定画面専用の複雑なウィジェットも、必要に応じて `widgets/` 下のサブディレクトリに整理します。

2.  **画面の実装 (`lib/presentation/pages/`)**:
    - `Scaffold` を配置し、切り出したウィジェットを組み合わせて画面を構築します。
    - 状態管理は Riverpod を使用するため、`ConsumerWidget` または `ConsumerStatefulWidget` を継承します。

3.  **スタイリング (`lib/core/`)**:
    - Stitchから得られた色情報やフォントサイズは、ハードコーディングせず `lib/core/app_theme.dart` (または類似のテーマ定義ファイル) に集約することを推奨します。

## ベストプラクティス

- **忠実な再現とUX**: デザインの見た目だけでなく、仕様書にある「視認性重視」「巨大なボタン」といったUXの意図を汲み取って実装してください。
- **フィードバック**: 生成されたデザインが仕様と食い違う場合は、再度プロンプトを調整して生成し直すか、ユーザーに確認して調整してください。
