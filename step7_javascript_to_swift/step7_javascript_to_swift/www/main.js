var button = document.getElementById("swiftButton");
button.addEventListener("click", function() {
                        var messgeToPost = {'ButtonId':'swiftButton'};
                        window.webkit.messageHandlers.swiftButtonClicked.postMessage(messgeToPost);
                        
                        },false);