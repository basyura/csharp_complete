#!ruby
#-*- coding: utf-8 -*-
#
# 辞書を作るためのクローラ
# 結構適当・・・
#
require 'mechanize'

BASE_URL = 'http://msdn.microsoft.com/en-us/library'

@cached_url = []
@spaces     = []

def crawl(search_url, depth = 0)
  return if depth > 1
  puts search_url
  page = Mechanize.new.get(search_url)
  page.search('table[@id="memberList"]/tr/td/a').each do |link|
    url = link[:href]
    next if @cached_url.include?(url)
    next if url !~ /^#{BASE_URL}/
    @spaces     << link.text
    @cached_url << url
    puts link.text + "\t" + url
    crawl(url , depth + 1)
  end
end

crawl('http://msdn.microsoft.com/en-us/library/gg145045.aspx')

open("name_spaces.txt","w") do |file|
  @spaces.uniq.sort.each do |line|
    file.puts line
  end
end

