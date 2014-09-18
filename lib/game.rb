class Game

  def initialize
    @messages= []
    @players= []
  end

  def add_player1(player)
    @player1 = player
    @players << @player1
  end

  def add_player2(player)
    @player2 = player
    @players << @player2
  end

  def has_player1?
    players.first == @player1
  end

	BEATS = {rock: :scissors, scissors: :paper, paper: :rock}

	attr_accessor :player1, :player2, :messages

	def winner
		return player1 if BEATS[normalize(player1.pick)] == normalize(player2.pick)
		player2
	end

	def players
		[@player1, @player2]
	end

	def normalize(pick)
		pick.downcase.to_sym
	end

	def loser
		(players - [winner]).first
	end

	def play
		return @messages << "It's a draw! You both picked #{winner.pick}." if player1.pick == player2.pick
		@messages << "#{winner.name.capitalize}'s #{winner.pick.downcase} beats #{loser.name.capitalize}'s #{loser.pick.downcase}!"
	end
end

















