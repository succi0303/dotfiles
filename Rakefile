# coding: utf-8
require 'rake/clean'

SOURCE_DIR = "#{Dir.pwd}/"
TARGET_DIR = "#{ENV['HOME']}/"
DOT_FILES = ['.zshrc', '.zshenv', '.vimrc', '.gvimrc', '.tmux.conf']

DOT_FILES.each do |file_name|
  CLOBBER.include(TARGET_DIR + file_name)
end

task :default => :install

desc 'Install dotfiles'
task :install do
  
  DOT_FILES.each do |file_name|
    if File.exists?(TARGET_DIR + file_name)
      puts "#{file_name}が既に存在します"
    else
      sh "ln -s #{SOURCE_DIR + file_name} #{TARGET_DIR + file_name}"
    end
  end
end

