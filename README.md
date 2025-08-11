# What

https://about.gitlab.com/blog/journey-through-gits-20-year-history/

初期のgitのコマンドを作成
- init-db
- update-cache
- write-tree
- commit-tree
- cat-file
- show-diff

```
# 1) リポジトリ初期化
./init-db.sh

# 2) ファイル作成
echo "hello" > a.txt

# 3) インデックスに追加（擬似）
./update-cache.sh a.txt

# 4) 差分の確認
./show-diff.sh

# 5) ツリーを書き出し（ツリーIDが出力される）
t=$(./write-tree.sh)

# 6) コミットの作成（コミットIDが出力される）
export COMMITTER_NAME="Your Name"
export COMMITTER_EMAIL="you@example.com"
c=$(printf "first commit\n" | ./commit-tree.sh "$t")

# 7) オブジェクト表示（コミット内容を見る）
./cat-file.sh "$c"
```
