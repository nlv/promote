$( function() {
    var callbackPopup;
    callbackPopup =  $( "#callback-popup" ).dialog({
            autoOpen: false,
            resizable: false,
            height: "auto",
            width: 300,
            modal: true,
            buttons: {
            "Отправить заявку": function() {
                $( this ).dialog( "close" );

                var name  = $('#callback-popup input[name=name]').val();
                var phone = $('#callback-popup input[name=phone]').val();
                sendCallback(name, phone);
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

    $('#page-callback2-phone-submit').change(function() {
        var name  = $('#page-callback2-popup input[name=name]').val();
        var phone = $('#page-callback2-popup input[name=phone]').val();
        sendCallback(name, phone);

    })
});

function sendCallback (name, phone) {
    var payload = {
        callbackName: name,
        callbackPhone: phone
    };
    fetch("http://robin-bol.ru:4321/api/callback",
    {
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
            },
        method: "POST",
        // body: data
        body: JSON.stringify(payload)
    })
    .then(function(res){ return res.json(); })
    .then(function(data){ alert( 'Заявка отправлена!'); })                
    .catch(function() {alert('Отправка заявок временно недоступна. Позвоните сами!')})
}
