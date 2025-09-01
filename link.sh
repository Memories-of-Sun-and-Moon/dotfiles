#!/usr/bin/env bash
set -euo pipefail

# このスクリプトが置かれているディレクトリ
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# "リポジトリ内の相対パス:ホーム配下の設置先" の形式
files_and_paths=(
  ".vimrc:$HOME/.vimrc"
  ".zshrc:$HOME/.zshrc"
)

# 先頭の ~ を $HOME に置き換える関数
expand_tilde() {
  local p="$1"
  # 先頭が "~/" なら $HOME に置換
  if [[ "$p" == "~/"* ]]; then
    printf '%s\n' "$HOME/${p#~/}"
  elif [[ "$p" == "~" ]]; then
    printf '%s\n' "$HOME"
  else
    printf '%s\n' "$p"
  fi
}

create_symlink() {
  local src_rel="$1"              # リポジトリ内の相対パス（例: .zshrc）
  local dst_spec="$2"             # "~/.zshrc" など
  local dst_path
  dst_path="$(expand_tilde "$dst_spec")"

  # ソースの絶対パス（スクリプトの場所基準）
  local src_abs
  src_abs="$(realpath "$script_dir/$src_rel")"

  # 親ディレクトリを作成
  mkdir -p "$(dirname "$dst_path")"

  # 既存があるなら退避（リンクもファイルも対象）
  if [[ -e "$dst_path" || -L "$dst_path" ]]; then
    mv -f "$dst_path" "$dst_path.bak"
  fi

  ln -s "$src_abs" "$dst_path"
  echo "linked: $dst_path → $src_abs"
}

for entry in "${files_and_paths[@]}"; do
  IFS=":" read -r src dst <<< "$entry"
  create_symlink "$src" "$dst"
done
