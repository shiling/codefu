<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Code Kungfu</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description"
		content="Create your AI and duel with the other player.">
	<meta name="author" content="Indra Adam">
	
	<!-- Site scripts and styles -->
    <jsp:include page="include.jsp"/>
	    
    <!-- Page scripts and styles -->
	<style type="text/css">
		body {
			padding-top: 40px;
			padding-bottom: 0px;
		}
	</style>
</head>

<body>
    <!-- Header -->
    <jsp:include page="header.jsp"/>
    
    <!-- Content -->
	<div class="container">
		<div class="hero-unit span4">
			<h1 class="title">Train your coding skill</h1>
			<br />
			<p class="lead">Welcome to a cyber colosseum where your AI will
				fight each other until the last drop of code.</p>
			<p>
				<a href="./Battle.jsp" class="btn btn-success btn-large">Let
					the Battle Begins &raquo;</a>
			</p>
		</div>
		<div class="span5">
			<div class="maintext span5">
				<pre>Hi there, welcome to Code Kungfu! 
				<!--<br>Let's start by doing simple game.</br>
				</pre>
				<textarea rows="7" class="span5 borderless">></textarea>-->
				</br>This is a place to sharpen your javascript skill.
				</br>In this website, you have to build your own Tic Tac Toe AI to defeat our AI in a Tic Tac Toe game.
				</br>Good luck!
				</br>
				</pre>
			</div>
		</div>

	</div>
	<!-- /container -->
	&nbsp;
	<br />
	<br />
	<div class="separatorline"></div>
	<div class="infoblock">
		<div class="container">
			<div class="span2"></div>
			<div class="span2 maininfo1">
				<img src="./img/computer1.png" width="82%" height="82%" />
				<h4>Versus Computer</h4>
				<p>Try and defeat our super Tic Tac Toe AI, if you can.</p>
			</div>
			<div class="span1"></div>
			<div class="span2 maininfo">
				<!--<img src="./bootstrap/img/player.png" width="50%" height="50%"/><br/>-->
				<img src="./img/player.png" width="90%" height="90%" />
				<h4>Versus Player</h4>
				<p>Play against the other players from all around the world.</p>
			</div>
			<div class="span1"></div>
			<div class="span2 maininfo">
				<img src="./img/star2.png" width="90%" height="90%" />
				<h4>Leader Board</h4>
				<p>Climb up the leader board to be the Tic Tac Toe master.</p>
			</div>
			<div class="span2"></div>
		</div>
	</div>
	<div class="footerblock">
		<div class="container">
			<div class="span3 pull-left">
				<a class="cleanlink" target="blank" href="http://smu.edu.sg">Singapore
					Management University</a>
			</div>
			<div class="span8 pull-right"></div>
			<div class="span1 pull-right">
				<a class="cleanlink" href="./aboutus.jsp">About Us</a>
			</div>
		</div>
	</div>
</body>
</html>