# Bash
###Sudo -E したくないとき
https://wiki.archlinux.jp/index.php/Sudo
### sed 豆知識
sed -e "s/*./$string/g" path/to/file
みたいに正規表現の中で変数を展開するとき、変数の中に正規表現のメタ文字が入っているとうまく動作しない
sed専用の変数を別で定義する　（なにか別に解決方法があるのかもしれない）
