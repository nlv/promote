$( function() {
    var callbackPopup;
    callbackPopup =  $( "#callback-popup" ).dialog({
            autoOpen: false,
            resizable: false,
            height: "auto",
            width: 400,
            modal: true,
            buttons: {
            "Отправить заявку": function() {
                $( this ).dialog( "close" );
            },
            "Отмена": function() {
                $( this ).dialog( "close" );
            }
            }
        });

    // $('.callback-opener').on('click', function (event) {
    $('.callback-opener').click(function (event) {
        event.preventDefault();
        callbackPopup.dialog('open')
    })
});
