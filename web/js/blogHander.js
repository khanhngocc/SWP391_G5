function deleteBlog(id) {
    var result = confirm("Do you want to delete this blog?");
    if (result) {
        window.location.href = "DeleteBlog?id=" + id;
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
