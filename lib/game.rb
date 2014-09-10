class Game 

  def initialize
    @messages= []
  end

  def add_player(player)
  	return @player2 = player if has_player?
  	@player1 = player
  end

  def has_player?
  	!@player1.nil?
  end

	BEATS = {rock: :scissors, scissors: :paper, paper: :rock}

	attr_reader :player1, :player2

	def winner
		return player1  if BEATS[normalize(player1.pick)] == normalize(player2.pick)
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

	def message
		return @messages << "It's a Draw! You both picked #{winner.pick}." if player1.pick == player2.pick
		@messages << "#{winner.name.capitalize} beats #{loser.name.capitalize} with #{winner.pick}!"
	end
end
