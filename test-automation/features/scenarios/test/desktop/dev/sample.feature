@desktop @sample
Feature: Web Automation task - erafone & tokopedia

@test
  Scenario: user combine product iphone 15 pro between 2 website
    Given user access website erafone
    When user input "iPhone 15 Pro" on searchbox erafone
    And user click button search on erafone
    And system show search result page for "iPhone 15 Pro" on erafone
    And user sort by ascending on erafone from cheapest
    And user open new tab
    And user access website tokopedia
    And user input "iPhone 15 Pro" on searchbox tokopedia
    And user click button search on tokopedia
    And system show search result page for "iPhone 15 Pro" on tokopedia
    And user sort by ascending on tokopedia from cheapest
    And user combine & compare product from both website
