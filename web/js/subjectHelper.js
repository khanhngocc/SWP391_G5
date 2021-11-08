function changeStatus(id, status) {

    var mess;

    if (status === 'Published')
        mess = "Do you want to publish this subject?";
    else
        mess = "Do you want to unpublish this subject?";


    var result = confirm(mess);
    if (result) {
        window.location.href = "ChangeSubjectStatus?id=" + id + "&status=" + status;
    }

}
