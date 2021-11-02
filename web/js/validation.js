

function filevalidation(mess) {
    var fi = document.getElementById('fileImg');
    const standardedExtensionImg = ['.jpg', '.jpeg', '.png', '.gif'];

    var fileValue = fi.value;

    if (fileValue)
    {
        var startIndex = fileValue.lastIndexOf(".");
        var filename = fileValue.substring(startIndex, fileValue.length);
        // Check if any file is selected.
        if (fi.files.length > 0) {
            for (const i = 0; i <= fi.files.length - 1; i++) {

                const fsize = fi.files.item(i).size;
                const file = Math.round((fsize / 1024));
                // The size of the file.

                if (standardedExtensionImg.includes(filename) == false)
                {
                    document.getElementById(mess).textContent
                            = 'file input is not a image';
                } else if (file > 1024)
                {
                    document.getElementById(mess).textContent
                            = 'size of file inputed comes over 1024 KB ';
                } else
                {
                    document.getElementById("frm").submit();
                }

            }
        }
    } else
    {
        document.getElementById("frm").submit();
    }


}
