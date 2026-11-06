#!/bin/bash
function usage {
cat >&2 <<EOS
Devcontainer に bash でログインする。 Devcontainerが起動していなければ起動する

[usage]
  $0 [options]

[options]
 -h | --help:
   ヘルプを表示
 -r | --recreate:
   Devcontainerを作り直す
EOS
exit 1
}


SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
WORKSPACE_FOLDER="$(cd "$SCRIPT_DIR/../.." && pwd)"

cd $WORKSPACE_FOLDER
DEVCONTAINER_UP_OPTIONS=""
while [ "$#" != 0 ]; do
  case "$1" in
    -h | --help     ) usage ;;
    -r | --recreate ) DEVCONTAINER_UP_OPTIONS="$DEVCONTAINER_UP_OPTIONS --remove-existing-container" ;;
    *               ) echo "[error] $1 : 不正なオプションです" >&2; usage ;;
  esac
  shift
done

set -e

DEVCONTAINER="npx --yes --prefer-online @devcontainers/cli@latest"

# 起動していなければ起動し、起動済みならスキップして exec に進む
$DEVCONTAINER up --workspace-folder . $DEVCONTAINER_UP_OPTIONS

# NOTE: devcontainer.jsonにも日本語入力のためのLANG=ja_JP.UTF-8の設定はあるが一応こちらでも渡しておく
$DEVCONTAINER exec --workspace-folder . env LANG=ja_JP.UTF-8 /bin/bash
