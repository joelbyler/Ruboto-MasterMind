Feature: About screen

  Scenario: About application is located on the menu
    Given the application launches
    When the user chooses 'About' from the menu
    Then he will see the applications version info
