# dotfiles

設定ファイル用のリポジトリです。

### 利用環境

* OSX 10.9.x on MacBookPro Retina '13

### 主な利用アプリケーション

* zsh
* tmux
* vim
* git
* slate
* Vimperator(on Firefox)

### 初期設定の手順

初期設定の手順です。

#### Xcodeのインストール

App StoreでXcodeを選択、手順にしたがってインストールする。

#### Command Line Tools for Xcodeのインストール

Xcodeを起動、環境設定-Downloadsタブ-ComponentsからCommand Line Toolsのinstallを実行する。

#### Homebrewのインストール

```bash
$ ruby -e "$(curl -fsSL https://raw.github.com/mxc./homebrew/go)"
```

#### gitのインストール

```bash
$ brew install git
```

#### zshのインストール

```bash
$ brew install zsh
```

デフォルトシェルをzshに変更する

```bash
$ chsh -s /bin/zsh
```

上記コマンドを実行後、ターミナルを再起動する。

#### auto-fuのインストール

```bash
$ cd ~
$ mkdir .zsh
$ cd .zsh
$ git clone git://github.com/hchbaw/auto-fu.zsh.git
```

#### z.shのインストール

```bash
$ brew install z
```

/usr/local/binにz.shへのシンボリックリンクを作成する。
補足：z.shの実体は/usr/local/Cellar/z/バージョン番号/etc/profile.d/z.shに作成される。

#### Powerline-shellのインストール

```bash
$ cd .zsh
$ git clone http://github.com/milkbikis/powerline-shell.git
$ cd powerline-shell
$ cp config.py.dist config.py
# config.pyを必要に応じて編集
$ ./install.py
```

#### tmuxのインストール

```bash
$ brew install tmux
```

OSXのクリップボードとコピーを共有するために"reattach-to-user-namespace"をインストールする

```bash
$ brew install reattach-to-user-namespace
```

#### Rubyのインストール

rbenv + ruby-buildを使用してRubyをインストールします。

* [rbenvでRuby2.0をインストール+複数バージョンの切替 | prime factor](http://succi.jp/blog/?p=746)

```bash
$ brew install rbenv
$ brew install ruby-build
$ brew upgrade ruby-build
$ brew install openssl
$ rbenv install 2.0.0-p0
$ rbenv global 2.0.0-p0
$ rbenv rehash
$ ruby -v
```

#### blueclothのインストール

```bash
$ gem install bluecloth
```

#### Vimのインストール

[macvim-kaoriya - MacVim KaoriYa - Google Project Hosting](http://code.google.com/p/macvim-kaoriya/)からdmgをダウンロード。MacVim.appをApplicationディレクトリに配置する。

#### VimのNeoBundleを設定

```bash
$ cd ~
$ mkdir -p .vim/bundle
$ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```

#### 設定ファイルのインストール

```bash
$ git clone git://github.com/succi0303/dotfiles
$ cd dotfiles
$ rake install
```

ホームディレクトリ配下に設定ファイルへのシンボリックリンクを作成します。

#### アンインストール

```bash
$ rake clobber
```

ホームディレクトリ配下のシンボリックリンクを削除します。

- - -

#### 参考情報

* [川野辺正博, アリスとボブのGit入門レッスン, 秀和システム](http://www.amazon.co.jp/アリスとボブのGit入門レッスン-川野辺-正博/dp/4798035009)

aliasの"tree"は「アリスとボブのGit入門レッスン」に記載されていたものをそのまま使用しています。

* [MBA-HACK: Vimの日本語入力を快適にする設定](http://mba-hack.blogspot.jp/2012/09/vim.html)

InsertModeでEscを押したときにIMEをOFFにする設定は必須だと思います。(要KeyRemap4MacBook)

* [中島能和, zsh最強シェル入門, 翔泳社](http://www.amazon.co.jp/zsh最強シェル入門-中島-能和/dp/479811815X)
