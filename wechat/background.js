chrome.app.runtime.onLaunched.addListener(function() {
    chrome.app.window.create('index.html', {
        id: 'wechat_web',
        width: 893,
        height: 600,
        maxWidth: 893,
        maxHeight: 600,
        minWidth: 893,
        minHeight: 600
    });



    // chrome.app.window.onClosed.addListener(function() {
    //     chrome.app.window.create('index.html', {
    //         id: 'wechat_web2',
    //         width: 1000,
    //         height: 700
    //     });
    // });


});
