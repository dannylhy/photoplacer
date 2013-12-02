function loginRedirect() {
	window.location = "http://dev.m.gatech.edu/login/private?url=" + frontendUrl + "main.html&sessionTransfer=window";
}

function skipLogin() {
	window.location = frontendUrl + "main.html";
}