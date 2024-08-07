def set_browser_resolution_to(width, height)
  Capybara.page.current_window.resize_to(width, height)
end

def set_browser_resolution_to_maximize
  if @tags.include? '@mweb'
    set_browser_resolution_to ENV['MWEB_WIDTH'], ENV['MWEB_HEIGHT']
  elsif @tags.include? '@desktop'
    Capybara.page.current_window.maximize
  end
end

def wait_in_sec(number_in_second)
  sleep number_in_second.to_i
end

def switch_to_window_title(page_title)
  switch_to_window { title == page_title }
end

def refreshPage
  Capybara.current_session.driver.execute_script("window.location.reload()")
end

def execute_js_script(script)
  Capybara.current_session.driver.execute_script(script)
end