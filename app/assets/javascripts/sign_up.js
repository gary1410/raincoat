var SignUp = {
	init: function() {
		$('#new_user').on("ajax:success", this.displayHome)
	},

	displayHome: function(event, data, status, xhr) {
		$('#new_user').css('display','none')
		$('#forecast').append(data.name)
	}
}

var LogIn = {
  display: function(){
    $('.login_modal').css('display','block')
  },
  hide: function(){
    $('.login_modal').css('display','none')
  }
}

var SetWindow = {
  height: function(){
    var height = $(window).height();
    $('.form').css('height', height)
    $('#clouds').css('height', height)
  }
}

var insertName = {
  name: function(){
    $submittedName = $('#user_name').val()
    if ($submittedName){
      $('.submitted-name').text($submittedName)
    }
  }
}

var ScrollOn = {

  letsBegin: function(){
    $('.strip2').on('click', function(){
      var $name = $('.name').position().top
      $('body').animate({scrollTop: $name}, 300)
    })
  },

  clickName: function(){
    $('#name-submit').on('click', function(){
      $('.zipcode').css('display', 'block')
      insertName.name()
      var $zipcode = $('.zipcode').position().top
      $('body').animate({scrollTop: $zipcode}, 300)
    })
  },

clickZipcode: function(){
	$('#zipcode-submit').on('click', function(){
		$('.email').css('display', 'block')
    insertName.name()
    var $email = $('.email').position().top
   	$('body').animate({scrollTop: $email}, 300)
   })
},

	clickEmail: function(){
    $('#email-submit').on('click', function(){
      $('.password').css('display', 'block')
      var $password = $('.password').position().top
      $('body').animate({scrollTop: $password}, 300)
    })
  }
}

$(document).ready(function() {
	SignUp.init();
  SetWindow.height();
  $(window).resize(SetWindow.height);
  ScrollOn.letsBegin();
  ScrollOn.clickName();
  ScrollOn.clickZipcode();
  ScrollOn.clickEmail();
  $('#login-button').on('click', LogIn.display)
  $('.fa-times-circle').on('click', LogIn.hide)
})
