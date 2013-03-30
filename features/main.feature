Feature: Input Screen

  Scenario: Welcome the user
    When the application launches
    Then I see "Enter four numbers below and submit your guess"
    And I can enter 4 numbers
    And I see a submit button

