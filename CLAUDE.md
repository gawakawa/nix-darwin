# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## ビルドコマンド
- nix-darwinの再ビルド: `darwin-rebuild build --flake ".#mac" --impure`
- 設定の適用: `darwin-rebuild switch --flake ".#mac" --impure`
- Nixファイルのフォーマット: `nixfmt-rfc-style ファイル名.nix`
- Luaファイルのフォーマット: `stylua ファイル名.lua`

## コードスタイルガイドライン
- **Nix**: 2スペースインデント、nixfmt-rfc-styleの規約に従う
- **Lua**: 2スペースインデント、末尾の空白を避ける
- **インポート**: 種類ごとにグループ化、標準ライブラリを最初に配置
- **エラー処理**: 詳細なエラーメッセージを使用、パターンマッチングを優先
- **命名規則**: 関数はcamelCase、変数はsnake_caseを使用
- **型**: 有益な場合は明示的な型アノテーションを使用
- **整形**: 適切な行の長さ（≤100文字）と適切なインデントを維持
- **コメント**: 複雑なロジックにはコメントを追加、関数の目的を文書化

## ディレクトリ構成
```
/Users/iota/.config/nix-darwin/
├── configuration.nix   # メインの設定ファイル
├── flake.nix           # Nix Flakeの設定
├── home.nix            # ホーム環境の設定
├── lang/               # 各言語環境の設定
│   ├── haskell/
│   ├── idris2/
│   ├── lean/
│   ├── purescript/
│   ├── rust/
│   └── typescript/
└── programs/           # 各プログラムの設定
    ├── direnv.nix
    ├── git.nix
    ├── neovim.nix
    ├── nvim/           # Neovimの詳細設定
    │   ├── init.lua
    │   └── lua/
    │       ├── config/
    │       └── plugins/
    ├── starship.nix
    ├── wezterm.lua
    ├── wezterm.nix
    └── zsh.nix
```