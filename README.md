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


### log

```
bash-5.2$ ./log.sh 
commit f93ef5c11d5b45511daf4e1fde5a973c84a3090e
tree 98594f3c65612fdcc57b4488d7cbb95a76c23143
parent 196acca7ce8cf4374989b239d2eab4cd63955fbd
author Demo User <demo@example.com> Mon, 11 Aug 2025 22:11:52 +0900

docs: add notes.md

commit 196acca7ce8cf4374989b239d2eab4cd63955fbd
tree 77c1449931235a00f1fd5375760c1e5273a08cec
parent e0a8f14a05f26d1f0387b006ac09f26eb4045007
author Demo User <demo@example.com> Mon, 11 Aug 2025 22:11:52 +0900

feat: update a.txt to v2

commit e0a8f14a05f26d1f0387b006ac09f26eb4045007
tree 3f530d7bbe07a530363896851405adf5cba9bf22

author Demo User <demo@example.com> Mon, 11 Aug 2025 22:11:52 +0900

feat: first commit

bash-5.2$ ./log.sh 
commit f93ef5c11d5b45511daf4e1fde5a973c84a3090e
tree 98594f3c65612fdcc57b4488d7cbb95a76c23143
parent 196acca7ce8cf4374989b239d2eab4cd63955fbd
author Demo User <demo@example.com> Mon, 11 Aug 2025 22:11:52 +0900

docs: add notes.md

commit 196acca7ce8cf4374989b239d2eab4cd63955fbd
tree 77c1449931235a00f1fd5375760c1e5273a08cec
parent e0a8f14a05f26d1f0387b006ac09f26eb4045007
author Demo User <demo@example.com> Mon, 11 Aug 2025 22:11:52 +0900

feat: update a.txt to v2

commit e0a8f14a05f26d1f0387b006ac09f26eb4045007
tree 3f530d7bbe07a530363896851405adf5cba9bf22

author Demo User <demo@example.com> Mon, 11 Aug 2025 22:11:52 +0900

feat: first commit
```