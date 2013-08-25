# coding: utf-8
require 'rake/clean'

SOURCE_DIR = "#{Dir.pwd}/dotfiles/"
TARGET_DIR = "#{ENV['HOME']}/"

dot_files = []
cd 'dotfiles' do
  Dir.glob('.*') do |file|
    next if file == '.'
    next if file == '..'
    dot_files << file
  end
end

# clobber
dot_files.each do |file_name|
  CLOBBER.include(TARGET_DIR + file_name)
end

task :default => :install

desc 'Install dotfiles'
task :install do
  
  dot_files.each do |file_name|
    if File.exists?(TARGET_DIR + file_name)
      puts "#{file_name}が既に存在します"
    else
      sh "ln -s #{SOURCE_DIR + file_name} #{TARGET_DIR + file_name}"
    end
  end
end

