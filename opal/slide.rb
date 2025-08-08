require 'native'
require_relative 'gibier2/parser.rb'

SLIDE_WIDTH = 1920
SLIDE_HEIGHT = 1080

uri = $$.location.toString
p uri
base_uri = uri.sub(/#\d+$/, '')

def update_page(page, top, left, zoom)
  slide = $$.document.getElementsByClassName('slide')[0]
  slide.innerHTML = page.to_html
  page_el = $$.document.getElementsByClassName('page')[0]
  page_el.style.width = "#{SLIDE_WIDTH}px"
  page_el.style.height = "#{SLIDE_HEIGHT}px"
  page_el.style.top = "#{top}px"
  page_el.style.left = "#{left}px"
  page_el.style.zoom = "#{zoom}"
end

height = $$.innerHeight.to_f
width = $$.innerWidth.to_f
zoom = (height / width < SLIDE_HEIGHT.to_f / SLIDE_WIDTH.to_f) ?  height / SLIDE_HEIGHT : width / SLIDE_WIDTH

top = (height / zoom - SLIDE_HEIGHT) / 2
left = (width / zoom - SLIDE_WIDTH) / 2

pages = nil

$$.document.addEventListener('keydown') do |event|
  e = Native(event)
  slide = $$.document.getElementsByClassName('slide')[0]
  case e.keyCode
  when 39
    page = pages.next
  when 37
    page = pages.prev
  end

  update_page(page, top, left, zoom)
  $$.location = pages.page_num == 0 ? base_uri : base_uri + "##{pages.page_num}"
end

$$.fetch('slide.md').then do |data|
  Native(data).text.then do |content|
    pages = Gibier2::Parser.parse(content)
    num = uri.match?(/#\d+$/) ? uri.match(/#(\d+)$/)[1].to_i : 0
    page = pages.page(num)
    update_page(page, top, left, zoom)
  end
end
