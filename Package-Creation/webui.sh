#!/bin/bash

mkdir /opt/tak/certs/files/packages/web
cat << EOF > "/opt/tak/certs/files/packages/web/app.py"
from flask import Flask, render_template, request, redirect
import subprocess

app = Flask(__name__, template_folder='/var/www/html/')

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/create', methods=['POST'])
def create_package():
    capid = request.form['capid']

    # Run the shell script with the CAPID as a command-line argument
    subprocess.run(['/opt/tak/certs/files/packages/create.sh', capid], text=True, cwd='/opt/tak/certs/files/packages/')

    return redirect('/')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8446, debug=True) 
EOF


cat << EOF > "INSERT HERE/index.html"
<html lang="en"><head>
  
  <link rel="icon" type="image/x-icon" href="../favicon.ico">
    <meta charset="utf-8">
    <title>Metrics Dashboard</title>
    
    <!-- <link rel="stylesheet" href="css/main.css">-->
	<link rel="stylesheet" href="../tablesorter/style.css" type="text/css" media="print, projection, screen">
	<link rel="stylesheet" href="../jquery/jquery-ui.css" type="text/css" media="print, projection, screen">
	
	<link rel="stylesheet" href="../css/bootstrap-theme.min.css" type="text/css" media="print, projection, screen">
	<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css" media="print, projection, screen">
	
	<script type="text/javascript" src="../jquery/jquery-3.5.0.js"></script> 
	<script type="text/javascript" src="../jquery/jquery-ui.min.js"></script> 
	
	<script type="text/javascript" src="../lib/angular/angular.min.js"></script>
	<script type="text/javascript" src="../lib/angular/angular-route.min.js"></script>
	<script type="text/javascript" src="../lib/angular/angular-resource.min.js"></script>
	<script type="text/javascript" src="../lib/angular/angular-messages.min.js"></script>
	<script type="text/javascript" src="../lib/d3/d3.min.js"></script>

	<script src="js/app.js"></script>
	<script src="js/controllers.js"></script>
	<script src="js/services.js"></script>
</head>

<body style="font:18px arial, sans-serif;">
	<!-- ngInclude: '../menubar.html' --><div data-ng-include="'../menubar.html'" class="ng-scope">

  
    <meta charset="utf-8" class="ng-scope">

  

  <!-- The style-sheet and JQuery code below is from cssmenumaker.com -->
  <!-- To edit the menu, just modify the ul/li html content below. -->

  <style class="ng-scope">
    html {
	font-family: sans-serif;
    }
    .sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	right: 0;
	background-color: #222;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 10px;
    }
    .sidenav a {
	padding: 8px 8px;
	text-decoration: none;
	color: #818181;
	display: block;
	transition: 0.3s;
    }
    .sidenav li > a:hover {
	color: #f1f1f1;
	background: #2b2f3a;
    }
    .menu-button {
	position: sticky;
	height: 60px;
	color: #818181;
	background-color: #222;
	padding: 8px 8px 8px 8px;
	text-decoration: none;
	width: 100%;
    }
    .menu-button span {
	cursor: pointer;
    }

    .accordion li {
	list-style: none;
    }
    .accordion:hover {
	cursor: pointer;
	color: #f1f1f1;
	background: #2b2f3a;
    }

    .accordion:after {
	content: '\02795'; /* Unicode character for "plus" sign (+) */
	font-size: 13px;
	color: #777;
	float: right;
	margin-left: 5px;
    }

    .active:after {
	content: "\2796"; /* Unicode character for "minus" sign (-) */
    }
    .panel {
	background-color: #f5f5dc;
	display: none;
	overflow: hidden;
    }
    .panel a {
	padding: 8px 8px 8px;
	text-decoration: none;
	color: #818181;
	display: block;
    }

    .tak_logo {
	width:50px;
	height:50px;
	display:inline-block;
	margin-top: -4px;
	margin-left: 10px;
	filter: drop-shadow(0 2px 3px #cecece);
    }
  </style>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Data Package Creation</title>
</head>
<body>
  <h2>Data Package Creation</h2>
  <form action="/create" method="post">
    <label for="name">What Is your CAP ID Number:</label>
    <input type="text" id="capid" name="capid" required=""><br><br>

    <input type="submit" value="Create Package">
  </form>
</body></html>
EOF

cat << EOF > "INSERT HERE/create"
create 
EOF
