var button = document.getElementById("swiftButton");
button.addEventListener("click", function() {
                        var messgeToPost = {'ButtonId':'swiftButton'};
                        window.webkit.messageHandlers.swiftButtonClicked.postMessage(messgeToPost);
                        
                        },false);

function receivedAnswer() {
    document.getElementById("answerDiv").innerHTML = "Response Received"; 
    
}