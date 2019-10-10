# coding: utf-8
require 'rake/clean'

SOURCE_DIR = "#{Dir.pwd}/dotfiles/"
TARGET_DIR = "#{ENV['HOME']}/"

dot_files = []
Dir.glob(['dotfiles/.*', 'dotfiles/_*']) do |path|
  name = File.basename(path)
  next if name == '.'
  next if name == '..'
  dot_files << name
end

# clobber
dot_files.each do |file_name|
  CLOBBER.include(TARGET_DIR + file_name)
end

task :default => :install

desc 'Install dotfiles.'
task :install do
  dot_files.each do |file_name|
    if File.exists?(TARGET_DIR + file_name)
      puts "#{file_name}が既に存在します。"
    else
      sh "ln -s #{SOURCE_DIR + file_name} #{TARGET_DIR + file_name}"
    end
  end
  puts "設定ファイルをインストールしました。"
end

desc 'Setup for dotfiles.'
task :setup => ["vim:setup", "zsh:setup", "nvm:setup"] do
  "セットアップ処理を完了しました。"
end

namespace :vim do
  directory backup_dir = "#{ENV['HOME']}/.vim/backup"

  desc 'Setup for vim'
  task :setup => [backup_dir, :vim_plug] do
    puts 'vimのセットアップを完了しました。'
  end

  task :vim_plug do
    sh 'curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  end
end

namespace :zsh do
  desc 'Setup for zsh'
  task :setup => [:zplug, :base16_shell] do
  end

  task :zplug do
    if File.exists?("#{ENV['HOME']}/.zplug/init.zsh")
      puts 'zplugはすでにインストールされています。'
    else
      sh 'curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh'
    end
  end

  task :base16_shell do
    if Dir.exist?("#{ENV['HOME']}/.config/base16-shell")
      puts 'base16-shellはすでにインストールされています。'
    else
      sh 'git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell'
    end
  end
end

namespace :nvm do
  directory nvm_dir = "#{ENV['HOME']}/.nvm"

  task :setup => [nvm_dir] do
    puts 'nvmのセットアップを完了しました。'
  end
end

namespace :brew do
  desc 'Install homebrew.'
  task :install do
    if `which brew`.empty?
      sh 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
    else
      puts 'brewが既に存在します。'
    end
  end

  desc 'Execute brewfile.sh'
  task :bundle do
    if File.exists? './brewfile.sh'
      sh 'sh ./brewfile.sh'
    else
      puts 'brewfile.shが存在しません。'
    end
  end
end
