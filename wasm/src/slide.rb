require 'js'
require 'wasm_drb'
require_relative 'pages'

SLIDE_WIDTH = 1920
SLIDE_HEIGHT = 1080

def update_page(page, top, left, zoom)
  slide = JS.global[:document].getElementsByClassName('slide')[0]
  slide[:innerHTML] = page.to_html
  page_el = JS.global[:document].getElementsByClassName('page')[0]
  page_el[:style][:width] = "#{SLIDE_WIDTH}px"
  page_el[:style][:height] = "#{SLIDE_HEIGHT}px"
  page_el[:style][:top] = "#{top}px"
  page_el[:style][:left] = "#{left}px"
  page_el[:style][:zoom] = "#{zoom}"
end

height = JS.global[:window][:innerHeight].to_f
width = JS.global[:window][:innerWidth].to_f
zoom = (height / width < SLIDE_HEIGHT.to_f / SLIDE_WIDTH.to_f) ?  height / SLIDE_HEIGHT : width / SLIDE_WIDTH

top = (height / zoom - SLIDE_HEIGHT) / 2
left = (width / zoom - SLIDE_WIDTH) / 2

JS.global[:document].addEventListener('keydown') do |e|
  Fiber.new do
    pages = Pages.pages.await
    slide = JS.global[:document].getElementsByClassName('slide')[0]
    case e[:keyCode]
    when 39
      page = pages.next
      slide[:innerHTML] = page.to_html
    when 37
      page = pages.prev
      slide[:innerHTML] = page.to_html
    end

    update_page(page, top, left, zoom)
  end.transfer
end

pages = Pages.pages.await
page = pages.current
update_page(page, top, left, zoom)
