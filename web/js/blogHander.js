
function changeBlogStatus(id,status) {
    
    var mess;
    
    if(status === 'Active')
        mess = "Do you want to deactive this blog";
    else
         mess = "Do you want to active this blog";
    
    
    var result = confirm(mess);
    if (result) {
        window.location.href = "ChangeBlogStatus?id=" + id+"&status="+status;
    }

}

function changeSlideStatus(id,status) {
    
    var mess;
    
    if(status === 'Published')
        mess = "Do you want to unpublished this slide";
    else
         mess = "Do you want to published this slide";
    
    
    var result = confirm(mess);
    if (result) {
        window.location.href = "ChangeSlideStatus?id=" + id+"&status="+status;
    }

}
