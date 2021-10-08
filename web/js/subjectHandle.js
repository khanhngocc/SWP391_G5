function deleteSubject(id) {
    var result = confirm("Do you want to delete this subject?");
    if (result) {
        window.location.href = "DeleteSubject?id=" + id;
    }

}
