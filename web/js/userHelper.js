function changeUserStatus(id, status) {

    var mess;

    if (status === 'Active')
        mess = "Do you want to deactive this user?";
    else
        mess = "Do you want to active this user?";


    var result = confirm(mess);
    if (result) {
        window.location.href = "ChangeUserStatus?id=" + id + "&status=" + status;
    }

}


