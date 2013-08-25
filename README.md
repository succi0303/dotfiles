# dotfiles

### 概要

設定ファイル用のリポジトリです。

#### 利用環境

* OSX 10.8.x on MacBookAir'11

#### 対象アプリケーション

* git
* tmux
* vim
* zsh

#### インストール

最低限の初期設定の手順です。

* Xcodeをインストールする。

App StoreでXcodeを選択し、インストールする。

* Command Line Tools for Xcodeをインストールする。

Xcodeを起動、環境設定-Downloadsタブ-ComponentsからCommand Line Toolsのinstallを実行する。

* Homebrewをインストールする。

```bash
$ ruby -e "$(curl -fsSL https://raw.github.com/mxc./homebrew/go)"
```

* gitをインストールする。

```bash
$ brew install git
```

* zshをインストールする。

```bash
$ brew install zsh
```

* デフォルトシェルをzshに変更する

```bash
$ chsh -l /bin/zsh
```

上記コマンドを実行後、ターミナルを再起動する。

* auto-fuをインストールする

```bash
cd
mkdir .zsh
cd .zsh
git clone git://github.com/hchbaw/auto-fu.zsh.git
```

* z.shをインストールする。

```bash
brew install z
```

/usr/local/binにz.shへのシンボリックリンクを作成する
z.shの実体は/usr/local/Cellar/z/バージョン番号/etc/profile.d/z.shに作成される。

* tmuxをインストールする。

```bash
$ brew install tmux
```

* rbenvをインストールする。

```bash
$ brew install rbenv
```

* MacVim-KaoriYaをインストールする。

[macvim-kaoriya - MacVim KaoriYa - Google Project Hosting](http://code.google.com/p/macvim-kaoriya/)からdmgをダウンロード。MacVim.appをApplicationディレクトリに配置する。

* VimのNeoBundleを設定する

```bash
cd
mkdir -p .vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```

* dotfilesをインストールする。

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

### git

#### 設定ファイル

* .gitconfig
* .gitignore

#### 参考情報

* [川野辺正博, アリスとボブのGit入門レッスン, 秀和システム](http://www.amazon.co.jp/アリスとボブのGit入門レッスン-川野辺-正博/dp/4798035009)

aliasの"tree"は「アリスとボブのGit入門レッスン」に記載されていたものをそのまま使用しています。

- - -

### tmux

#### 設定ファイル

* .tmux.conf

#### 外部ツール

* tmux-MacOSX-pasteboard

#### 参考情報

* [ChirsJohnsen/tmux-MacOSX-pasteboard](https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard)

OSXのクリップボードとtmuxを連携させるための設定

- - -

### vim

#### 設定ファイル

* .vimrc
* .gvimrc

#### 外部ツール

* MacVim-KaoriYa

- - -

### zsh

#### 設定ファイル

* .zshrc
* .zshenv

#### 外部ツール

* auto-fu
* z
* rbenv
* MacVim-KaoriYa

#### 参考情報

* [中島能和, zsh最強シェル入門, 翔泳社](http://www.amazon.co.jp/zsh最強シェル入門-中島-能和/dp/479811815X)
