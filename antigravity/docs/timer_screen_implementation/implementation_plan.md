# タイマー画面UI実装計画

HTMLで提供されたデザインをFlutterで完全に再現します。
既存の `TimerPage` を改修し、コンポーネントを分割して実装します。

## ユーザーレビューが必要な事項

- **特になし**: 提供されたHTMLデザインを忠実に再現します。

## 変更内容

### [Presentation Layer: Widgets]

以下のウィジェットを新規作成し、責任を分割します。

#### [NEW] [lib/presentation/widgets/timer/timer_header.dart](file:///home/mti1122hj/classroom_timer/lib/presentation/widgets/timer/timer_header.dart)

- ヘッダー部分（アイコン、タイトル、設定ボタン）

#### [NEW] [lib/presentation/widgets/timer/overall_progress_card.dart](file:///home/mti1122hj/classroom_timer/lib/presentation/widgets/timer/overall_progress_card.dart)

- 全体の進捗を表示するカード
- 進捗バー、経過時間/合計時間、オンスケジュール表示

#### [NEW] [lib/presentation/widgets/timer/circular_timer_display.dart](file:///home/mti1122hj/classroom_timer/lib/presentation/widgets/timer/circular_timer_display.dart)

- メインの円形タイマー表示
- SVGまたはCustomPaintで円形プログレスを描画
- 中央に残り時間を大きく表示

#### [NEW] [lib/presentation/widgets/timer/timer_controls.dart](file:///home/mti1122hj/classroom_timer/lib/presentation/widgets/timer/timer_controls.dart)

- 一時停止、+1分、リセットボタンの配置

#### [NEW] [lib/presentation/widgets/timer/next_section_button.dart](file:///home/mti1122hj/classroom_timer/lib/presentation/widgets/timer/next_section_button.dart)

- 画面下部の「次のセクションへ」ボタン

### [Presentation Layer: Page]

#### [MODIFY] [lib/presentation/pages/timer_page.dart](file:///home/mti1122hj/classroom_timer/lib/presentation/pages/timer_page.dart)

- `Scaffold` の `body` を上記ウィジェットを組み合わせて再構築
- カラーパレットやテーマの適用（HTMLのTailwind configに基づく）
  - Primary: `#5579fa`
  - Background: `#f5f6f8` (Light), `#0f1423` (Dark)

### [Core Layer]

#### [NEW] [lib/core/app_colors.dart](file:///home/mti1122hj/classroom_timer/lib/core/app_colors.dart)

- アプリ内で使用するカラー定数を定義

## 検証計画

### Automated Tests

- 新規作成するWidgetのレンダリングテスト (Widget Test)
- `TimerPage` が各コンポーネントを正しく表示しているかのテスト

### Manual Verification

- アプリを起動し、UIがHTMLデザインと一致しているか目視確認
- ダークモード切り替え時の表示確認（実装範囲に含まれる場合）
