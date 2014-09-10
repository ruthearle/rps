require 'game'

describe Game do
	let(:player1) {double :player1, name: "Stephen"}
	let(:player2) {double :player1, name: "Enrique"}
	let(:game)    {Game.new}
	let(:game_with_players) { Game.new }

	before(:each) do
		game_with_players.add_player(player1)
		game_with_players.add_player(player2)
	end

	it "can add the first player" do
    game.add_player(player1)
		expect(game.player1).to eq player1
	end

	it "can add the second player" do
    game.add_player(player1)
    game.add_player(player2)
		expect(game.player1).to eq player1
		expect(game.player2).to eq player2
	end

	context 'when playing' do

		it 'player one picks rock, player two picks scissors' do

			allow(player1).to receive(:pick).and_return("Rock")
			allow(player2).to receive(:pick).and_return("Scissors")
			expect(game_with_players.winner).to eq player1
		end

		it 'player one picks paper, player two picks scissors' do
			allow(player1).to receive(:pick).and_return("Paper")
			allow(player2).to receive(:pick).and_return("Scissors")
			expect(game_with_players.winner).to eq player2
		end

		it "player one picks paper, player two picks rock" do
			allow(player1).to receive(:pick).and_return("Paper")
			allow(player2).to receive(:pick).and_return("Rock")
			expect(game_with_players.winner).to eq player1
		end

		it "can be a draw" do
			allow(player1).to receive(:pick).and_return("Paper")
			allow(player2).to receive(:pick).and_return("Paper")
			expect(game_with_players.message).to eq (["It's a Draw! You both picked Paper."])
		end

		it "knows who has lost the game" do
			allow(player1).to receive(:pick).and_return("Paper")
			allow(player2).to receive(:pick).and_return("Rock")
			expect(game_with_players.loser).to eq player2
		end

		it "declares who has won and who has lost" do
			allow(player1).to receive(:pick).and_return("Paper")
			allow(player2).to receive(:pick).and_return("Scissors")
			expect(game_with_players.message).to eq(["Enrique beats Stephen with Scissors!"])
			allow(player1).to receive(:pick).and_return("Rock")
			allow(player2).to receive(:pick).and_return("Scissors")
			expect(game_with_players.message).to eq ["Enrique beats Stephen with Scissors!", "Stephen beats Enrique with Rock!"]
		end
	end
	

end
