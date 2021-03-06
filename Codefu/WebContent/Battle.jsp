<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Battle &middot; Code Kungfu</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description"
		content="Create your AI and duel with the other player.">
	<meta name="author" content="Indra Adam">
	
	<!-- Site scripts and styles -->
	<jsp:include page="include.jsp"/>
	
	<!-- Page scripts and styles -->
    <link rel="stylesheet" href="./styles/codemirror/codemirror.css">
	<style type="text/css">
		body {
	        padding-top: 40px;
	        padding-bottom: 0px;
	    }
		.CodeMirror {
			border: 1px solid black;
		}
		
		.CodeMirror-activeline-background {
			background: #e8f2ff !important;
		}
		.ttttable td{
            height: 100px;
            width: 100px;
            vertical-align: middle;
            text-align: center;
            font-size: 80px;
		}
	</style>
</head>
<body>
    <!-- Header -->
    <jsp:include page="header.jsp"/>
    
    <!-- Content -->
	<div class="container">
		<div class="span4">
			<div class="hero-unit span2">
				<h1>Battle</h1>
			</div>
			<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
			<table id="board" class="table table-bordered ttttable">
				<tr>
					<td id="0"></td>
					<td id="1" ></td>
					<td id="2" ></td>
				</tr>
				<tr>
					<td id="3" ></td>
					<td id="4" ></td>
					<td id="5" ></td>
				</tr>
				<tr>
					<td id="6" ></td>
					<td id="7" ></td>
					<td id="8" ></td>
				</tr>
			</table>
			<ul class="pager">
				<li id="previous" class="previous"><a href="#">&larr;</a></li>
				<li style="font-size:26pt;">Replay</li>
				<li id="next" class="next"><a href="#">&rarr;</a></li>
			</ul>
			<div class="container batchContainer">
			<div id="humanToken"></div>
			<div id="outcome"></div>
			</div>
			<div class="container batchContainer">
            <span id="ratesTxt"></span>
			<span id="win" class="batchResult"></span>
			<span id="draw" class="batchResult"></span>
			<span id="lose" class="batchResult"></span>
			</div>
		</div>	
		<div class="span7">
		</p>
			<p id="pre-codeTxt" class="cm-s-default" style="font-family:'Lucida Console'; font-size:12">
/*******************************************************************
 INSTRUCTIONS:
 Implement a Tic Tac Toe bot that makes a move when given the game board in the function below.
 Your bot will be randomly assigned to player 'x' or 'o' and will be played alternatively with another bot in our system.
 Your bot has to create new_board containing the move that it wants to make.
 All the best! 

 PARAMETERS:
 - token: player your bot is assigned to, 'x' or 'o'
 - board: current state of the board, e.g. '****x***o' represents a board with 'x' in the center and 'o' in the bottom right corner

 RETURN:
 - new_board: board with your bot's new move, e.g. '****x*x*o'
*******************************************************************/
function get_next_move(token, board){
            </p>
			<textarea id="codeTxt" rows="15" class="span7 playarea">
//replace this sample code with your own code! 

//this is a dumb AI that places its token in any random spot that is empty

while(true){    //keep looping until bot finds a nice empty spot
  var randomSpot = Math.floor(Math.random() * 9);   //try a random spot
  if(board[randomSpot] == '*'){ //check if random spot is empty
    //hurray! the spot is empty! 
    //create new_board with the bot's token in chosen spot
    new_board = board.substr(0, randomSpot) + token 
        + board.substr(randomSpot + 1);
    break;  //found a spot, stop the search loop 
  }
}           

//now, try making a smarter bot!
//hint: try taking the center spot if it is empty ;)
			</textarea>
			<p id="post-codeTxt" class="cm-s-default" style="font-family:'Lucida Console'; font-size:12">            
return new_board;
}
            </p>
			<br />
			<div class="pull-right">
				<!--<button class="btn btn-success disabled" id="submitBtn" data-toggle="tooltip" title="Coming Soon">Submit</button>-->
				<!--<div class="btn-group dropup">-->
					<div class="fb-like" data-href="http://codefu-5euzxjdg6b.elasticbeanstalk.com " data-send="false" data-layout="button_count" data-width="450" data-show-faces="false"></div>
					<button class="btn btn-warning" id="testBtn">Run</button>
					<!--<button class="btn dropdown-toggle btn-warning"
						data-toggle="dropdown">
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a tabindex="-1" href="">Easy</a></li>
						<li><a tabindex="-1" href="">Medium</a></li>
						<li><a tabindex="-1" href="">Hard</a></li>    
					</ul>
				</div>-->
				<!--<button id="reseBtn" class="btn btn-danger">Reset</button>-->
				<button class="btn" id="saveBtn">Save</button>
			</div>
		</div>
	</div>
	<!-- /container -->
	&nbsp;&nbsp;
	<div class="container">
		<div class="span1"></div>
		<div id="notloggedinalert"></div>
		<!--<div id="signInAlert" class="span9 alert">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<strong>You are not signed in!</strong> Sign in to participate in
			tournament and have your score registered.
		</div>-->
	</div>
	<br />
	<div id="results"></div>
	<div class="footerblock">
		<div class="container">
			<div class="span3">
				<a class="cleanlink" target="blank" href="http://smu.edu.sg">Singapore
					Management University</a>
			</div>
			<div class="span8 pull-right"></div>
			<div class="span1 pull-right">
				<a class="cleanlink" href="./aboutus.html">About Us</a>
			</div>
		</div>
	</div>

    <!-- Scripts -->
    <script src="./scripts/codemirror/codemirror.js"></script>
    <script src="./scripts/codemirror/javascript.js"></script>
    <script src="./scripts/codemirror/runmode.js"></script>
    <script src="./scripts/codemirror/active-line.js"></script>
    <script src="./scripts/tictactoe.js"></script>
    <script type="text/javascript">
        
		//syntax highlighting
		CodeMirror.runMode($("#pre-codeTxt").html(), "text/javascript",document.getElementById("pre-codeTxt"));
		CodeMirror.runMode($("#post-codeTxt").html(), "text/javascript",document.getElementById("post-codeTxt"));
        
        //syntax highlighting on editor
        var editor = CodeMirror.fromTextArea(document.getElementById("codeTxt"), {
            lineNumbers : true,
            styleActiveLine : true,
            lineWrapping : true,
            matchBrackets : true,
            extraKeys : {
                "Enter" : "newlineAndIndentContinueComment"
            }
        });
        
        //get code for logged in users
        loggedIn.bind('ready', function(){
            $.ajax({
                url: 'ttt/get',
                type: 'post',
                data: {
                    email: userEmail,
                },
                success: function(data){
                	editor.setValue(data.code);
                }
            });
        });
        
        //test bot
        var testBot = function(numTrials) {
            var t3 = new tictactoe();
            var result = $.parseJSON(t3.run_bot(editor.getValue(), numTrials));
            displayResults(result);
        }
        
        //test bot til lose
        var testBotTilLose = function() {
            var t3 = new tictactoe();
            var result;
            while(true){
                result = $.parseJSON(t3.run_bot(editor.getValue(), 1));
                if(result.loseCount===1){
                    break;
                }
            }
            displayResults(result);
        }
        
        //display results of test bot
        var displayResults = function(results){
        	
        	//display last history
        	$("#board").data('history',results.history);
        	displayHistory();
        	
        	//display outcome message
        	if(results.error){ //there is an error!
        		$("#outcome").html("<div class='alert alert-danger'><strong>Error!</strong></div>");
        	}
        	else if(results.outcome==='-'){
                $("#outcome").html("<div class='alert alert-warning'><strong>Draw!</strong></div>");
        	}else if((results.outcome==='x' && results.x==='human') || (results.outcome==='o' && results.o==='human')){
                $("#outcome").html("<div class='alert alert-success'><strong>You Win!</strong></div>");
        	}else{
                $("#outcome").html("<div class='alert alert-danger'><strong>You Lose!</strong></div>");
        	}
        	
        	//display which player the bot is 
        	if(results.x === 'human'){
        		 $("#humanToken").html("<div class='alert alert-info center'><strong>You are X</strong></div>");
        	}else{
        		$("#humanToken").html("<div class='alert alert-info center'><strong>You are O</strong></div>");
        	}
        	//display batch statistics
        	$("#ratesTxt").html("<h4>Chances of:</h4>");
        	$("#draw").html("<div class='alert alert-warning'><strong>Draw: "+results.drawCount+"%</strong></div>");
        	$("#lose").html("<div class='alert alert-danger'><strong>Lose: "+results.loseCount+"%</strong></div>");
        	$("#win").html("<div class='alert alert-success'><strong>Win: "+results.winCount+"%</strong></div>");
        };
        
        //display history
        var displayHistory = function(offset){
        	//set index
        	var index;
        	if(!offset){
        		var index = $("#board").data('history').length-1; //last
                $("#board").data('index', index);
        	}else{
                var index = $("#board").data('index') + offset;
                $("#board").data('index', index);
        	}
        	
        	//display
        	var state = $("#board").data('history')[index];
        	for(var pos=0; pos<9; pos++){
                $("#"+pos).html(state[pos]==='*'?'':state[pos]);
        	}
        };
        
        //save bot
        var saveBot = function(participate){
        	if(userName && userEmail){
        		$('#saveBtn').attr('disabled','disabled');
        		$('#submitBtn').attr('disabled','disabled');
                $.ajax({
                    url: 'ttt/save',
                    type: 'post',
                    data: {
                        username: userName,
                        email: userEmail,   
                        code: editor.getValue(),
                        participate: participate    //to participate in tournament or not
                    },
                    success: function(data){
                        console.log('saved.');
                        $('#saveBtn').removeAttr('disabled');
                        $('#submitBtn').removeAttr('disabled');
                    }
                });
            }else{
            	//not logged in
            	$('#signInModal').modal('show');
            }
        };
        
        //event listeners
        $("#testBtn").on('click', function(){testBot(1000);});
        $("#previous").on('click', function(){displayHistory(-1);});
        $("#next").on('click', function(){displayHistory(1);});
        $('#saveBtn').on('click', function(){saveBot(false);});
        $('#submitBtn').on('click', function(){saveBot(true);});
        $('#resetBtn').on('click', reset);
        
    </script>	
</body>
</html>