$(document).ready(function(){
	var windowHeight = $(window).height();
	var triggerHeight = $(window).scrollTop() + 200;
	 
	$(window).scroll(function(){
	    var y = $(window).scrollTop() ;
	 
	    if(y > triggerHeight) {
	        $("header").addClass("shrink");
	        $("header img").addClass("img-shrink");
	    } else{
	    	$("header").removeClass("shrink");
	    	$("header img").removeClass("img-shrink");
	    }
	});

});