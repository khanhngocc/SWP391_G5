function changeStatus(id, status) {

    var mess;

    if (status === 'Active')
        mess = "Do you want to deactive this setting?";
    else
        mess = "Do you want to active this setting?";


    var result = confirm(mess);
    if (result) {
        window.location.href = "ChangeSettingStatus?id=" + id + "&status=" + status;
    }

}

