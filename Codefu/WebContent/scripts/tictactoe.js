function tictactoe(){
	
	//dumb AI that places its token in any random spot that is empty
	this.ai_get_next_move = function(token, board){
		while(true){    
			var randomSpot = Math.floor(Math.random() * 9);   
			if(board[randomSpot] == '*'){ 
				board = board.substr(0, randomSpot) + token + board.substr(randomSpot + 1);
				break; 
			}
		}    
		return board;
	};
	
	//get_next_move function for player x
	this.x_get_next_move = function(board){
		return this.ai_get_next_move('x',board);
	};
	
	//get_next_move function for player o
	this.o_get_next_move = function(board){
		return this.ai_get_next_move('o',board);
	};
	
	//ensure that move is valid, i.e.
	//1. correct number of 'x' and 'o' tokens - 'x' must be equal to or one more than 'o'
	//2. placed tokens should remain the same
	//3. only one empty spot is changed
	this.validate_move = function(last_board, new_board){
	
		//ensure correct number of 'x' and 'o'
		var num_x = new_board.split('x').length - 1;
		var num_o = new_board.split('o').length - 1;
		if(!(num_x === num_o || num_x === num_o + 1)){
			return false;	//wrong number of 'x' and 'o
		}
		
		//check that place tokens remain the same and count number of new tokens
		var changed = 0;
		for(var i = 0; i < 9; i++){
			if(last_board[i]!==new_board[i]){	//value changed
				if(last_board[i]==='*'){	//new token placed
					changed++;
				}else{	//existing token changed, invalid
					return false;
				}
			}
		}
		
		//more than one new tokens, invalid
		if(changed!==1){
			return false;
		}
		
		//everything is okay
		return true;
		
	};
	
	//evaluate board for end game condition
	//returns undefined when game has not ended, 
	//returns 'x' or 'o' if respective players won,
	//returns '-' if game is a draw
	this.evaluate = function(currentPlayer, board){
		var threeInARow = currentPlayer + currentPlayer + currentPlayer;
		var lines = [
			board[0] + board[1] + board[2],	//row 1
			board[3] + board[4] + board[5],	//row 2
			board[6] + board[7] + board[8],	//row 3
			board[0] + board[3] + board[6],	//col 1
			board[1] + board[4] + board[7],	//col 2
			board[2] + board[5] + board[8], //col 3
			board[0] + board[4] + board[8],	//diagonal \
			board[6] + board[4] + board[2],	//diagonal /
		];
		var outcome;
		$.each(lines, function(index, value){	//check each line permutation for winning three in a row
			if(value===threeInARow){
				outcome = currentPlayer;	//current player won
			}
		});
		if(outcome===undefined && board.search('\\*')===-1){	//nobody won, board is full, draw
			outcome = '-';
		}
		return outcome;
	};
	
	//run the game
	this.run = function(){
	
		//variables
		var board = '*********';	//empty starting board
		var history = [board];	//stores game history
		var currentPlayer = 'x';	//starting player
		var outcome;	//outcome of game, see evaluate() method
		
		//run the game
		while(outcome===undefined){	//while game has not ended
			
			//make a move
			if(currentPlayer==='x'){
				board = this.x_get_next_move(board);
			}else{
				board = this.o_get_next_move(board);
			}
			
			//process move
			history.push(board);	//save board in history
			if(this.validate_move(history[history.length-2],board)){	//valid move is played
				outcome = this.evaluate(currentPlayer, board);	//check if game has ended
				currentPlayer = currentPlayer==='x'?'o':'x';	//switch player
			}else{	//invalid move is played
				return JSON.stringify({'error':'Invalid move is played','history':history});
			}
			
		}
		return JSON.stringify({'outcome':outcome,'history':history});
		
	};
	
	//takes in a player bot code and runs it against AI bot
	this.run_bot = function(get_next_move_body, numTrials){
				
		//create player bot
		get_next_move_body += "return new_board;";
		var get_next_move = new Function('token','board', get_next_move_body);
	
		//run numTrials trials of the game
		var winCount = 0, loseCount = 0, drawCount = 0;
		var result;
		for(var i=0; i<numTrials; i++){
			
			//randomly assign bot to 'x' or 'o'
			var human = Math.random()<0.5?'x':'o';
			if(human==='x'){
				this.x_get_next_move = function(board){	//assign player bot
					return get_next_move('x',board);
				};
				this.o_get_next_move = function(board){	//assign ai bot
					return this.ai_get_next_move('o',board);
				};
			}else{
				this.o_get_next_move = function(board){	//assign player bot
					return get_next_move('o',board);
				};
				this.x_get_next_move = function(board){	//assign ai bot
					return this.ai_get_next_move('x',board);
				};
			}
			
			//run the game
			result = JSON.parse(this.run());
			result.x = human==='x'?'human':'computer';
			result.o = human==='o'?'human':'computer';
			
			//stop if there is an error
			if(result.error){
				break;
			}
			
			//
			if(result.outcome==='-'){
				drawCount++;
			}else if((result.x==='human' && result.outcome === 'x')||(result.o==='human' && result.outcome === 'o')){
				winCount++;
			}else{
				loseCount++;
			}
		}
		result.winCount = Math.floor(winCount / numTrials * 100);
		result.loseCount = Math.ceil(loseCount / numTrials * 100);
		result.drawCount = Math.ceil(drawCount / numTrials * 100);
		console.log("win: " + winCount + "; lose: " + loseCount + "; draw: " + drawCount);
		
		return JSON.stringify(result);
	
	};
	
};