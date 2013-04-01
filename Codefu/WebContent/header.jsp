<!-- Navigation Bar -->
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse"
                data-target=".nav-collapse"> <span class="icon-bar"></span> <span
                class="icon-bar"></span> <span class="icon-bar"></span>
            </a> <a class="brand logo" href="./codeKungfu.jsp">Code Kungfu</a>
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li><a href="./Battle.jsp" class="active">Battle</a></li>
                    <!--<li><a href="./scoreboard.html">Leader Board</a></li>-->
                </ul>
                <ul class="nav pull-right">
                    <li><a id="user-picture"></a></li>
                    <li><a id="user-name"></a></li>
                    <li><a id="user-email"></a></li>
                    <li><a id="signInBtn" href="" data-toggle="modal" data-target="#signInModal">Sign in</a></li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </div>
</div>

<!-- Sign In Dialog -->
<div id="signInModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3 class="modaltemp">Sign in</h3>
    </div>
    <div class="modal-body">
        <button id="fb-auth" class="btn btn-primary">Connect with Facebook</button>
    </div>
</div>

<!-- Facebook Login -->
<div id="fb-root"></div>
<script type="text/javascript">

	var loggedIn = $({});
	loggedIn.bind('ready', function(){console.log('logged in!');});
	
    var userName, userEmail;
    var connectButton = document.getElementById('fb-auth');
	var signInButton = document.getElementById('signInBtn');
	var userNameDom = document.getElementById('user-name'); 
	var userPicDom = document.getElementById('user-picture');
	
	//get facebook connect api
	(function() {
        var e = document.createElement('script'); e.async = true;
        e.src = document.location.protocol + '//connect.facebook.net/en_US/all.js';
        document.getElementById('fb-root').appendChild(e);
    }());
	
	//initialise facebook connect plugin
	window.fbAsyncInit = function() {
		FB.init({ appId: '223110031167007', status: true, cookie: true, xfbml: true, oauth: true});
	    // run once with current status and whenever the status changes
	    FB.getLoginStatus(updateStatus);
	    FB.Event.subscribe('auth.statusChange', updateStatus);  
	};
	
	function updateStatus(response) {
		
        if (response.authResponse) {
            //user is already logged in and connected
            FB.api('/me', function(info) {
                login(response, info);
            });
        } else {
            //user is not connected to your app or logged out
            connectButton.onclick = function() {
                FB.login(function(response) {
                    if (response.authResponse) {
                        FB.api('/me', function(info) {
                            login(response, info);
                        });    
                    } else {
                        //user cancelled login or did not grant authorization
                    }
                }, {scope:'email,user_about_me'});      
            };
        }
    }
	
	function login(response, info){
		
	    if (response.authResponse) {
	    	
	    	//set username and email
	        userName = info.name;
	        userEmail = info.email;
	        
	        //display user's avatar
	        userNameDom.innerHTML = info.name;
	        //userPicDom.innerHTML = '<img src="https://graph.facebook.com/' + info.id + '/picture">';
	        
	        //hide sign in dom elements
	        signInButton.style.display="none";
	        $('#signInModal').modal('hide');
	        
	        //do other stuff after logged in
	        loggedIn.trigger('ready');
	    }
	}
	    
</script>

<!-- Google Analytics -->
<script type="text/javascript">
	var _gaq = _gaq || [];
	_gaq.push([ '_setAccount', 'UA-39614464-1' ]);
	_gaq.push([ '_trackPageview' ]);
	
	(function() {
	    var ga = document.createElement('script');
	    ga.type = 'text/javascript';
	    ga.async = true;
	    ga.src = ('https:' == document.location.protocol ? 'https://ssl'
	            : 'http://www')
	            + '.google-analytics.com/ga.js';
	    var s = document.getElementsByTagName('script')[0];
	    s.parentNode.insertBefore(ga, s);
	})();
</script>
