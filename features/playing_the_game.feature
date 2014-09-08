Feature: Playing
  In order to play Rock Paper Scissors
  As a player
  I need to get two players

Scenario: A player can register
    Given I am on the homepage
    When I follow "New Game"
    Then I should see "Name?"
    And I enter my name
    Then I should be ready to play
