var SignUp = {
	init: function() {
		$('.new_user').on("ajax:success", this.displayHome)
    $('.new_user').on("ajax:error", this.displayErrors)
	},

	displayHome: function(event, data, status, xhr) {
		$('.form').css('display','none')
    $('header').css('display', 'none')
    $('.bottom-strips').css('display', 'none')
		$('#forecast').append(data.name)
    $('body').animate({scrollTop: 0}, 300)
	},

  displayErrors: function(event, xhr, status, error){
    $('.errors').append(xhr.responseJSON.error)
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

var keyPressEnter = {
  name: function(){
    $('#user_name').on('keypress', function(e){
      if(e.keyCode == 13) {
        e.preventDefault();
        $('#name-submit').click();
      }
    })
  },

  zipcode: function(){
    $('#user_zipcode').on('keypress', function(e){
      if (e.keyCode == 13){
        e.preventDefault();
        $('#zipcode-submit').click();
      }
    })
  },

  submit: function(){
    $('#user_password', '#user_email').on('keypress', function(e){
      if (e.keyCode == 13){
        $('#submit').click();
      }
    })
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
      if ($('#user_name').val() === "") {
        $('.input-name-error').slideToggle(300)
      } else {
        $('.zipcode').css('display', 'block')
        insertName.name()
        var $zipcode = $('.zipcode').position().top
        $('body').animate({scrollTop: $zipcode}, 300)
      }
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
  keyPressEnter.name();
  keyPressEnter.zipcode();
  keyPressEnter.submit();
  SetWindow.height();
  $(window).resize(SetWindow.height);
  ScrollOn.letsBegin();
  ScrollOn.clickName();
  ScrollOn.clickZipcode();
  ScrollOn.clickEmail();
  $('#nav-login').on('click', LogIn.display)
  $('.fa-times-circle').on('click', LogIn.hide)
})
