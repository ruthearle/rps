Feature: Playing
	In order to play Rock Paper Scissors
	As a player
	I need to get two players

Scenario: A player can register
	Given I am on the homepage
	When I click "New Game"
	And I enter my name
	Then I should be asked if I want to "Play Game?"

Scenario: A player is playing
	Given I click on "Paper"
	When I see RESULTS
	Then I should be able to click "Rock", "Paper", "Scissors" or click "Play new game?"
