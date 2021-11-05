function validUserProfile() {

    const standardedExtensionImg = ['.jpg', '.jpeg', '.png', '.gif'];
    // valid file

    let fi = document.forms["myForm"]["fname"];

    var fileValue = fi.value;
    if (fileValue)
    {
        var startIndex = fileValue.lastIndexOf(".");
        var filename = fileValue.substring(startIndex, fileValue.length);

        if (standardedExtensionImg.includes(filename) == false)
        {
            document.getElementById("messUpdateUser").textContent
                    = 'file input is not a image';
            return false;
        }


        for (const i = 0; i <= fi.files.length - 1; i++) {

            const fsize = fi.files.item(i).size;
            const file = Math.round((fsize / 1024));
            // The size of the file.



            if (file > 1024)
            {
                document.getElementById("messUpdateUser").textContent
                        = 'size of file inputed comes over 1024 KB ';
                return false;
            }

        }
    }
    // valid fullname


    let fullname = document.forms["myForm"]["name"].value;
    if (fullname.length > 100) {
        document.getElementById("messUpdateUser").textContent = "fullname comes over 100 characters";
        return false;
    }

    // valid phone

    let phone = document.forms["myForm"]["phone"].value;

    if (phone.length > 10) {
        document.getElementById("messUpdateUser").textContent = "phone comes over 10 characters";
        return false;
    }

    if (isVietnamesePhoneNumber(phone) === false) {
        document.getElementById("messUpdateUser").textContent = "phone is wrong format of phone";
        return false;
    }

}

function isVietnamesePhoneNumber(number) {
    return /(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\b/.test(number);
}