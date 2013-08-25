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
