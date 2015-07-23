#!/usr/bin/env ruby

require 'fileutils'

class Wrapbootstrap2rails
  attr_accessor :name, :src_assets, :dst_assets
  
  def initialize name, src_assets, dst_assets
    @name, @src_assets, @dst_assets = name, src_assets, dst_assets
    
    @src_assets.chop! if @src_assets[-1] == '/'
    @dst_assets.chop! if @dst_assets[-1] == '/'
  end
  
  def run
    copy_r 'js',  'javascripts'
    copy_r 'css', 'stylesheets'
    copy_r 'img', 'images'
    
    copy_r 'plugins', 'plugins'
    
    [ 'javascripts', 'stylesheets', 'images' ].each do |dir|
      `cd #{File.join(@dst_assets, dir)}; ln -s ../plugins plugins`
    end
  end
  
  def copy_r src_prefix, dst_prefix
    src = File.join(@src_assets, src_prefix)
    return if not File.exists? src
        
    dst = File.join(@dst_assets, dst_prefix, @name)

    FileUtils.mkdir_p dst
    FileUtils.cp_r src + "/.", dst
  end
end

Wrapbootstrap2rails.new(ARGV[0].dup, ARGV[1].dup, ARGV[2].dup).run

