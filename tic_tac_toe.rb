class Board
  attr_accessor :top, :middle, :bottom,:player,:turns

  def initialize
    self.top = [" "," "," "]

    self.middle = [" ", " "," "]

    self.bottom = [" "," "," "]

    self.player = 1
    
    self.turns = 0
  end

  def display
    self.player += 1
    "#{self.top}\n#{self.middle}\n#{self.bottom}\n\n"
  end
  def display_player
    self.player.even? ? "Player Two's turn\n" : "Player One's turn\n"
  end
  def winner?
      if self.top.all? "X" or self.top.all? "O"
         true

      elsif self.middle.all? "X" or self.middle.all? "O"
        true

      elsif self.bottom.all? "X" or self.bottom.all? "O"
        true

      elsif self.top[0] + self.middle[0] + self.bottom[0] == "OOO" or self.top[0] + self.middle[0] + self.bottom[0] == "XXX"
        true

      elsif self.top[1] + self.middle[1] + self.bottom[1] == "OOO" or self.top[1] + self.middle[1] + self.bottom[1] == "XXX"
        true

      elsif self.top[2] + self.middle[2] + self.bottom[2] == "OOO" or self.top[2] + self.middle[2] + self.bottom[2] == "XXX"
        true
      elsif self.top[0] + self.middle[1] + self.bottom[2] == "OOO" or self.top[0] + self.middle[1] + self.bottom[2] == "XXX"
        true
      elsif self.top[2] + self.middle[1] + self.bottom[0] == "OOO" or self.top[2] + self.middle[1] + self.bottom[0] == "XXX"
        true
      end
  end

  def players_choice(c)
    self.turns += 1
      if c.start_with? "top"

          if c.end_with? "left"
            self.player.even? ? self.top[0] = "O": self.top[0] = "X" 

          elsif c.end_with? "middle"
            self.player.even? ? self.top[1] = "O": self.top[1] = "X" 

          elsif c.end_with? "right"
            self.player.even? ? self.top[2] = "O": self.top[2] = "X" 
              
          end

      elsif c.start_with? "middle"

        if c.end_with? "left"
            self.player.even? ? self.middle[0] = "O": self.middle[0] = "X"   

        elsif c.end_with? "middle"
            self.player.even? ? self.middle[1] = "O": self.middle[1] = "X"   

        elsif c.end_with? "right"
            self.player.even? ? self.middle[2] = "O": self.middle[2] = "X"   
            
        end

      elsif c.start_with? "bottom"

        if c.end_with? "left"
            self.player.even? ? self.bottom[0] = "O": self.bottom[0] = "X"   

        elsif c.end_with? "middle"
            self.player.even? ? self.bottom[1] = "O": self.bottom[1] = "X"   

        elsif c.end_with? "right"
            self.player.even? ? self.bottom[2] = "O": self.bottom[2] = "X"   
            
        end

      end
  end
end

 def start_game
    puts"Tic Tac Toe Has Begun \n \n"
    nu_board = Board.new
    end_game = "DRAW"
      loop  do

        puts nu_board.display_player
        player_one = gets.chomp().downcase   
        nu_board.players_choice(player_one)
        puts nu_board.display
        break end_game = "PLAYER ONE WINS"  if nu_board.winner? == true

        break if nu_board.turns >=9

        puts nu_board.display_player
        player_two = gets.chomp().downcase
        nu_board.players_choice(player_two)
        puts nu_board.display
        break end_game = "PLAYER TWO WINS"  if nu_board.winner? == true

     end
     end_game
 end

 p start_game