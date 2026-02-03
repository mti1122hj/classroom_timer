# 実装計画: Linuxでの日本語文字化け修正

## ゴール

Linux環境 (flutter run) における日本語の文字化け (豆腐化) を解消する。

## 現状の問題

- Linux環境でアプリを実行すると、日本語が表示されないか文字化けしている。
- `pubspec.yaml` に `flutter_localizations` が未追加。
- `main.dart` にフォント指定がないため、システムの日本語フォントが見つからない場合にフォールバックできていない。

## 変更内容

### 依存関係の追加

- `flutter_localizations` を追加 (SDK)。

### コード修正

#### [MODIFY] lib/main.dart

- `GoogleFonts.notoSansJp` (または `zenKakuGothicNew`) をテーマに適用し、フォントをアプリにバンドル/ダウンロードさせることで環境依存を排除する。
- `localizationsDelegates` に以下を追加:
  - `GlobalMaterialLocalizations.delegate`
  - `GlobalWidgetsLocalizations.delegate`
  - `GlobalCupertinoLocalizations.delegate`
- `supportedLocales` に `Locale('ja', 'JP')` を追加。

## 検証計画

- `flutter run -d linux` を実行し、日本語が表示されることを確認する。
