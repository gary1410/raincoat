var SignUp = {
	init: function() {
		$('#new_user').on("ajax:success", this.displayHome)
	},

	displayHome: function(event, data, status, xhr) {
		$('#new_user').css('display','none')
		$('#clouds').prepend(data.name)
	}
}


$(document).ready(function() {
	SignUp.init();
})
