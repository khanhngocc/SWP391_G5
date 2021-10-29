
            var div = document.getElementById('display');
            var submitted = document.getElementById('submitted');
            var durationx = parseInt(document.getElementById('durationx').innerHTML);
              function CountDown(duration, display) {
                        var timer = duration, minutes, seconds;
                      var interVal=  setInterval(function () {
                            minutes = parseInt(timer / 60, 10);
                            seconds = parseInt(timer % 60, 10);
                            minutes = minutes < 10 ? "0" + minutes : minutes;
                            seconds = seconds < 10 ? "0" + seconds : seconds;
                    display.innerHTML ="<b>" + minutes + "m : " + seconds + "s" + "</b>";
                            if (timer > 0) {
                               --timer;
                            }else{
                       clearInterval(interVal);
                                SubmitFunction();
                             }
                       },1000);
                }
              function SubmitFunction(){
                submitted.innerHTML="Time is up!";
                window.location.href = "SubmitQuiz";
               }
               CountDown(durationx,div);

