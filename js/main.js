$(document).ready(function(){

    $('#navbar li').click (function () {
        $('#navbar li').removeClass('active');
        $(this).addClass('active');
    });

    $('#logo').click (function () {
        $('#navbar li').removeClass('active');
        $('#navbar li:first').addClass('active');
    });



    $("#navbar a, #logo").on('click', function(event){

        let offset = $('body').data('offset')
        console.log(offset);
        // Prevent default anchor click behavior
        event.preventDefault();

        // Store hash (#)
        var hash = this.hash;
        console.log('hash: ');
        console.log(hash);

        // Using jQuery's animate() method to add smooth page scroll
        // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area (the speed of the animation)
        $('html, body').animate({
            scrollTop: $(hash).offset().top
        }, 800, function(){


            // Add hash (#) to URL when done scrolling (default click behavior)
            window.location.hash = hash;
        });
    });
});
