Scbt.logout = function(){
	alert("You have logged out of the session")
	window.location = "session/new"
	throw new Error('')
}

Scbt.activate_account = function(){
	alert("You have not activated your account, you will be directed to your mail provider")
	window.location = "http://" + Scbt.Models.user.mailProvider()
	throw new Error('')
}

$(document).ajaxError(function(e, xhr, options, res){
	if(xhr.responseText == "require_auth"){
		Scbt.logout()
	} else if(xhr.responseText == "require_activation"){
		Scbt.activate_account()
	}
})

