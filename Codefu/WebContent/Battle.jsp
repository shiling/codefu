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
			<table id="board" class="table table-bordered ttttable">
				<tr height="100px" class="xobutton">
					<td id="0"></td>
					<td id="1"></td>
					<td id="2"></td>
				</tr>
				<tr height="100px" class="xobutton">
					<td id="3"></td>
					<td id="4"></td>
					<td id="5"></td>
				</tr>
				<tr height="100px" class="xobutton">
					<td id="6"></td>
					<td id="7"></td>
					<td id="8"></td>
				</tr>
			</table>
			<ul class="pager">
				<li id="previous" class="previous"><a href="#">&larr;</a></li>
				<li id="next" class="next"><a href="#">&rarr;</a></li>
			</ul>
			<div id="humanToken"></div>
			<div id="outcome"></div>
		</div>	
		<div class="span7">
		&nbsp;
			<ul class="nav nav-tabs">
				<li class="active"><a href="">Tic Tac Toe</a></li>
			</ul>
            <p id="pre-codeTxt" class="cm-s-default" style="font-family:'Lucida Console'; font-size:12">
// FUNCTION THAT MAKES A MOVE

// PARAMETERS:
// - token: player the bot is player, 'x' or 'o'
// - board: current state of the board, e.g. '****x***o' represents a board with 'x' in the center and 'o' in the bottom right corner

// RETURNS:
// - new_board: board with the new move, e.g. '****x*x*o'

function get_next_move(token, board){
            </p>
			<textarea id="codeTxt" rows="15" class="span7 playarea">
//replace this sample code with your own code!
//sample code: a dumb AI that places its token in any random spot that is empty
var retry = true;
while(retry){
  var tryPos = Math.floor(Math.random() * 9);
  if(board[tryPos] == '*'){
    new_board = board.substr(0, tryPos) + token + board.substr(tryPos + 1);
    retry = false;
  }
}
			</textarea>
			<p id="post-codeTxt" class="cm-s-default" style="font-family:'Lucida Console'; font-size:12">            
return new_board;
}
            </p>
			<br />
			<div class="pull-right">
				<button class="btn btn-success disabled" id="submitBtn" data-toggle="tooltip" title="Coming Soon">Submit</button>
				<!--<div class="btn-group dropup">-->
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
        var testBot = function() {
            var t3 = new tictactoe();
            var results = $.parseJSON(t3.run_bot(editor.getValue()));
            displayResults(results);
        }
        
        //display results of test bot
        var displayResults = function(results){
        	
        	//display last history
        	$("#board").data('history',results.history);
        	displayHistory();
        	
        	//display outcome message
        	if(results.outcome==='-'){
                $("#outcome").html("<div class='alert alert-warning'><strong>Draw!</strong></div>");
        	}else if((results.outcome==='x' && results.x==='human') || (results.outcome==='o' && results.o==='human')){
                $("#outcome").html("<div class='alert alert-success'><strong>You Win!</strong></div>");
        	}else{
                $("#outcome").html("<div class='alert alert-danger'><strong>You Lose!</strong></div>");
        	}
        	
        	if(results.x === 'human'){
        		 $("#humanToken").html("<div class='alert alert-info center'><strong>You are X</strong></div>");
        	}else{
        		$("#humanToken").html("<div class='alert alert-info center'><strong>You are O</strong></div>");
        	}
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
        $("#testBtn").on('click', testBot);
        $("#previous").on('click', function(){displayHistory(-1);});
        $("#next").on('click', function(){displayHistory(1);});
        $('#saveBtn').on('click', function(){saveBot(false);});
        $('#submitBtn').on('click', function(){saveBot(true);});
        $('#resetBtn').on('click', reset);
        
    </script>	
</body>
</html>