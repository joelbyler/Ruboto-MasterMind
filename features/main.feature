Feature: Input Screen
  Background: Setup the application for use with test numbers

  Scenario: Welcome the user
    Given the application launches
    And I switch to demo mode
    Then I see "Enter four numbers below and submit your guess"

  Scenario: User can guess
    Given I enter 4 numbers
    When I press the submit button
    Then I see "Nice guess!"

  Scenario: User recieves feedback on a guess
    Given I enter 2 correct numbers and 1 correct position
    When I press the submit button
    Then I see "You have 2 numbers and 1 positions correct."

  Scenario: User recieves feedback on a guess
    Given I enter all of the correct numbers
    When I press the submit button
    Then I see "Congrats, you solved the puzzle"

