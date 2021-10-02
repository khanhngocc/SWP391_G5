function deleteBlog(id) {
    var result = confirm("Do you want to delete this blog?");
    if (result) {
        window.location.href = "DeleteBlog?id=" + id;
    }

}
