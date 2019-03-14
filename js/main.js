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
        event.preventDefault();

        var hash = this.hash;

        $('html, body').animate({
            scrollTop: $(hash).offset().top
        }, 800, function(){
            window.location.hash = hash;
        });
    });

    var lastId,
    topMenu = $("#navbar"),
    // topMenuHeight = topMenu.outerHeight()+15,
    topMenuHeight = topMenu.outerHeight(),
    menuItems = topMenu.find("a"),
    scrollItems = menuItems.map(function(){
      var item = $($(this).attr("href"));
      if (item.length) { return item; }
    });
 
    $(window).scroll(function(){
    var fromTop = $(this).scrollTop()+topMenuHeight;
    var cur = scrollItems.map(function(){
        if ($(this).offset().top < fromTop)
        return this;
    });
    cur = cur[cur.length-1];
    var id = cur && cur.length ? cur[0].id : "";
    
    if (lastId !== id) {
        lastId = id;
        menuItems
            .parent().removeClass("active")
            .end().filter("[href='#"+id+"']").parent().addClass("active");

            if(history.pushState) {
                history.pushState(null, null, id);
            }
            else {
                location.hash = id;
            }


        // window.location.hash = id; // НЕ ПЛАВНО - СКАЧОК
    }                   
    });

});
