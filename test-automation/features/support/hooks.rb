require_relative '../page_object/test/pages/page_load'

Before do |scenario|
    @tags = scenario.source_tag_names
    loadBrowser
    set_browser_resolution_to_maximize
    @page=Page.new(@tags)
  end
  
  After do |scenario|
    # scenario_count(scenario)
    take_screenshot(scenario) if scenario.failed?
    Capybara.current_session.driver.quit
  end
  
  AfterConfiguration do |config|
    $tags_run = config.tag_expressions
  end

  # InstallPlugin do |configuration, registry|
  #   $tags_run = configuration.tag_expressions
  # end