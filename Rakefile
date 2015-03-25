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
task :setup => ["vim:setup", "zsh:setup"] do
  "セットアップ処理を完了しました。"
end

namespace :vim do
  directory backup_dir = "#{ENV['HOME']}/.vim/backup"
  directory snippet_dir = "#{ENV['HOME']}/.vim/vim_snippets"
  directory bundle_dir = "#{ENV['HOME']}/.vim/bundle"

  task :setup => [backup_dir, snippet_dir, :neobundle] do
    puts 'vimのセットアップを完了しました。'
  end

  task :neobundle => bundle_dir do
    if File.exists? "#{bundle_dir}/neobundle.vim"
      puts 'neobundle.vimが既に存在します。'
    else
      sh "git clone https://github.com/Shougo/neobundle.vim #{bundle_dir}/neobundle.vim"
      puts 'neobundle.vimをインストールしました。'
    end
  end
end

namespace :zsh do
  directory zsh_dir = "#{ENV['HOME']}/.zsh"

  task :setup => [zsh_dir, :auto_fu, :zsh_completions] do
    puts 'zshのセットアップを完了しました。'
  end

  task :auto_fu do
    if File.exists? "#{zsh_dir}/auto-fu.zsh"
      puts 'auto-fu.zshが既に存在します。'
    else
      sh "git clone https://github.com/hchbaw/auto-fu.zsh #{zsh_dir}/auto-fu.zsh"
    end
  end

  task :zsh_completions do
    if File.exists? "#{zsh_dir}/zsh-completions"
      puts 'zsh-completionsが既に存在します。'
    else
      sh "git clone https://github.com/zsh-users/zsh-completions #{zsh_dir}/zsh-completions"
    end
  end
end

namespace :brew do
  desc 'Install homebrew.'
  task :setup do
    if `which brew`.empty?
      sh 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
    else
      puts 'brewが既に存在します。'
    end
  end

  desc 'Execute brewfile.sh'
  task :file do
    if File.exists? './brewfile.sh'
      sh 'sh ./brewfile.sh'
    else
      puts 'brewfile.shが存在しません。'
    end
  end
end
