Feature: Playing
	In order to play Rock Paper Scissors
	As a player
	I need to get two players

Scenario: A player can register
	Given I am on the homepage
	When I click on "New Game"
	And I enter my name
	Then I should be asked if I want to play the game

Scenario: A player is playing
	Given I am ready to play the game
	When I click on "Paper"
	Then I see RESULTS
	Then I should be able to click "Rock", "Paper", "Scissors" or click "Play new game?"
