<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Scoreboard &middot; Code Kungfu</title>
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
		<div class="hero-unit span5">
			<h1>Leader Board</h1>
		</div>
		<div class="span4 pull-right profile">
			<img class="pull-right" src="./img/missing.png" width="39%"
				height="39%" />
			<h3 class="text-right">Anonymous&nbsp;&nbsp;</h3>
			<p class="lead text-right">
				Level: 0&nbsp;&nbsp;<br>Score: 0&nbsp;&nbsp;
			</p>
		</div>
	</div>
	<!-- /container -->

	<div class="container">
		<div class="span3">
			<ul class="nav nav-tabs nav-pills nav-stacked">
				<li class="active"><a href="">All-time Leader Board</a></li>
				<li><a href="">Daily Leader Board</a></li>
			</ul>
		</div>
		<div class="span1"></div>
		<div class="span7 center">
			<h2 class="page-header">Leader Board</h2>
			<table class="table table-bordered table-striped center" width="100%">
				<tr>
					<th width="10%">Rank</th>
					<th width="60%">Username</th>
					<th width="30%">Score</th>
				</tr>
				<tr>
					<td width="10%">1
					</th>
					<td width="60%">AI: Hard
					</th>
					<td width="30%">1000
					</th>
				</tr>
				<tr>
					<td width="10%">2
					</th>
					<td width="60%">AI: Medium
					</th>
					<td width="30%">800
					</th>
				</tr>
				<tr>
					<td width="10%">3
					</th>
					<td width="60%">AI: Easy
					</th>
					<td width="30%">600
					</th>
				</tr>
				<tr>
					<td width="10%">4
					</th>
					<td width="60%">Anonymous
					</th>
					<td width="30%">500
					</th>
				</tr>
				<tr>
					<td width="10%">5
					</th>
					<td width="60%">No Name
					</th>
					<td width="30%">400
					</th>
				</tr>
				<tr>
					<td width="10%">6
					</th>
					<td width="60%">Unknown
					</th>
					<td width="30%">100
					</th>
				</tr>
				<tr>
					<td width="10%">7
					</th>
					<td width="60%">123
					</th>
					<td width="30%">80
					</th>
				</tr>
				<tr>
					<td width="10%">8
					</th>
					<td width="60%">TicTacToe Master
					</th>
					<td width="30%">60
					</th>
				</tr>
				<tr>
					<td width="10%">9
					</th>
					<td width="60%">User456
					</th>
					<td width="30%">50
					</th>
				</tr>
				<tr>
					<td width="10%">10
					</th>
					<td width="60%">CloudIsAwesome
					</th>
					<td width="30%">10
					</th>
				</tr>
			</table>
		</div>
	</div>
	&nbsp;
	<br />
	<br />
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
</body>
</html>