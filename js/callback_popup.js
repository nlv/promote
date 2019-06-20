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
                var payload = {
                    callbackName: $('#callback-popup input[name=name]').val(),
                    callbackPhone: $('#callback-popup input[name=phone]').val()
                };
                
                fetch("https://localhost:8080/api/callback",
                {
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                      },
                    method: "POST",
                    // body: data
                    body: JSON.stringify(payload)
                })
                .then(function(res){ console.log(res); return res.json(); })
                .then(function(data){ alert( JSON.stringify( data ) ) })                
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
