SUBMODULE_GITHUB=github.com/tsuchiya-kai/blog-database
SUBMODULE_COPY_DIR_NAME=blog-database-copy

# envファイル読み込み（local検証用）
# source ./.env

# git の access-tokenが存在するかチェック
if [ "$GITHUB_ACCESS_TOKEN" == "" ]; then
  echo "Error: GITHUB_ACCESS_TOKEN is empty"
  exit 1
fi

# stop execution on error - don't let it build if something goes wrong
set -e

# vercel での build 時に submodule として扱うディレクトリを作成
rm -rf $SUBMODULE_COPY_DIR_NAME || true # 念のため削除コマンドを実行
mkdir $SUBMODULE_COPY_DIR_NAME
cd $SUBMODULE_COPY_DIR_NAME

# submodule のリポジトリをfetchする
git init
git remote add origin https://$GITHUB_ACCESS_TOKEN@$SUBMODULE_GITHUB # submodule のリポジトリを設定
git fetch
git checkout main