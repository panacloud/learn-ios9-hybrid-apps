var button = document.getElementById("swiftButton");
button.addEventListener("click", function() {
                        var messgeToPost = {'ButtonId':'swiftButton'};
                        window.webkit.messageHandlers.swiftButtonClicked.postMessage(messgeToPost);
                        
                        },false);

function receivedAnswer(message) {
    document.getElementById("answerDiv").innerHTML = message;
    
}
