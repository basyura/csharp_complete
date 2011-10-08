require 'mechanize'



base_url = 'http://msdn.microsoft.com/en-us/library'

@cached_url = []
@spaces = []

def crawl(search_url, depth = 0)
  if depth > 1
    return
  end
  puts search_url
  return if @cached_url.include?(search_url)
  agent = Mechanize.new
  begin
    page = agent.get(search_url)
  rescue => e
    puts e
    return
  end
  page.search('table[@id="memberList"]//a').each do |link|
    url = link[:href]
    next if @cached_url.include?(url)
    crawl(url , depth + 1)
    @spaces << link.text
    @cached_url << url
  end
end

crawl('http://msdn.microsoft.com/en-us/library/gg145045.aspx')

open("list.txt","w") do |file|
  @spaces.each do |line|
    file.puts line
  end
end

