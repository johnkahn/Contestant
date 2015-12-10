{% extends "templates/main.volt" %}

{% block title %}{{ super() }}
	Home
{% endblock %}

{% block content %}

<div class="row fill-height no-mar">
	<div class="col s12 m5 l3 blue-grey darken-4 white-text" style="position: relative;">
		<h3 class="center-align" style="margin-bottom: 0;">Submition</h3>
		<div class="row">
			<form id="submitionForm" method="post" action="/team/submit">
				<div class="input-field col s12">
					<select required>
						<option value="" disabled selected>Choose a problem</option>
						<option value="1">Problem 1</option>
						<option value="2">Problem 2</option>
						<option value="3">Problem 3</option>
						<option value="4">Problem 4</option>
						<option value="5">Problem 5</option>
						<option value="6">Problem 6</option>
						<option value="7">Problem 7</option>
						<option value="8">Problem 8</option>
						<option value="9">Problem 9</option>
						<option value="10">Problem 10</option>
						<option value="11">Problem 11</option>
						<option value="12">Problem 12</option>
						
					</select>
					<label>Problem</label>
				</div>
				<div class="input-field col s12">
					<select required>
						<option value="" disabled selected>Choose a language</option>
						<option value="java">Java</option>
						<option value="cpp">C++</option>
						<option value="csharp">C#</option>
					</select>
					<label>Language</label>
				</div>
				<div class="file-field input-field col s12">
					<div class="btn blue">
						<span>Java File</span>
						<input type="file" required>
					</div>
					<div class="file-path-wrapper">
						<input class="file-path validate" type="text">
					</div>
				</div>
				<div class="center-align col s12">
					<button class="btn waves-effect waves-light green" style="margin-top:10px;" type="submit" name="action">Submit
						<i class="material-icons right">send</i>
					</button>
				</div>
			</form>
		</div>
	</div>
	<div class="col s12 m7 l9 white pos-rel no-pad">
		<nav>
			<div class="nav-wrapper blue-grey darken-1">
				<ul id="nav-mobile">
					<li><a href="#">Scoreboard</a></li>
					<li><a href="#">Clarification</a></li>
					<li><a href="#">Editor</a></li>
				</ul>
			</div>
		</nav>

		<div id="editor">public class DryRun {

}</div>

		<a hreaf="http://www.google.com/" target="_blank" class="waves-effect waves-orange btn-flat creator-link white-text thin">Created by John Kahn</a>
	</div>
</div>

{% endblock %}

{% block scripts %}
{{ super() }}
{{ javascript_include("ace/ace.js") }}
<script>
	$('#submitionForm').ajaxForm(function(data) { 
		Snarl.addNotification({
			title: 'Problem 7 - Incorrect',
			text: 'There was a compiler error',
			icon: '<i class="material-icons right">clear</i>',
			timeout: null
		});
	});

	var editor = ace.edit("editor");
    editor.setTheme("ace/theme/monokai");
    editor.getSession().setMode("ace/mode/java");
    editor.setShowPrintMargin(false);
</script>
{% endblock %}