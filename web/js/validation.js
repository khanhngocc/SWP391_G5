
function validateEmail(email) {
    const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
}


function isVietnamesePhoneNumber(number) {
    return /(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\b/.test(number);
}


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



        if (fi.files[0].size > 1048576)
        {
            document.getElementById("messUpdateUser").textContent
                    = 'size of image inputed comes over 1KB ';
            return false;
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
    if (phone) {
        if (phone.length > 10) {
            document.getElementById("messUpdateUser").textContent = "phone comes over 10 characters";
            return false;
        }

        if (isVietnamesePhoneNumber(phone) === false) {
            document.getElementById("messUpdateUser").textContent = "phone is wrong format of phone";
            return false;
        }
    }


}


function validPractice() {
    const standardedExtensionImg = ['.jpg', '.jpeg', '.png', '.gif'];
    // valid file

    let fi = document.forms["myForm"]["fname"];

    var fileValue = fi.value;

    var startIndex = fileValue.lastIndexOf(".");
    var filename = fileValue.substring(startIndex, fileValue.length);

    if (standardedExtensionImg.includes(filename) == false)
    {
        document.getElementById("messCreatePractice").textContent
                = 'file input is not a image';
        return false;
    }



    if (fi.files[0].size > 1048576)
    {
        document.getElementById("messCreatePractice").textContent
                = 'size of image inputed comes over 1KB ';
        return false;
    }


    // valid title
    let title = document.forms["myForm"]["title"].value;
    if (title.length > 100) {
        document.getElementById("messCreatePractice").textContent = "title comes over 100 characters";
        return false;
    }

    // valid description
    let description = document.forms["myForm"]["description"].value;
    if (description)
    {
        if (description.length > 50) {
            document.getElementById("messCreatePractice").textContent = "description comes over 50 characters";
            return false;
        }
    }


    // valid duration
    let duration = document.forms["myForm"]["duration"].value;
    if (Number.isInteger(parseInt(duration)) === false) {
        document.getElementById("messCreatePractice").textContent = "duration is not a number";
        return false;
    }

    if (parseInt(duration) < 0)
    {
        document.getElementById("messCreatePractice").textContent = "duration is not a positive number";
        return false;
    }

    if (parseInt(duration) > 10800)
    {
        document.getElementById("messCreatePractice").textContent = "duration is out of boundary, (limit of duration is 10800 seconds)";
        return false;
    }

}


function validAddQuestionToPractice() {
    var numberOfQuestion = document.querySelectorAll('input[name="checkbox"]:checked').length;

    if (numberOfQuestion === 0)
    {
        document.getElementById("messCreatePractice").textContent = "please choose at least 1 question to add to quiz!";
        return false;
    }
}

function validQuestionImport() {
    const standardedExtensionFile = ['.xlsx'];
    // valid file

    let fi = document.forms["myForm"]["fname"];

    var fileValue = fi.value;

    var startIndex = fileValue.lastIndexOf(".");
    var filename = fileValue.substring(startIndex, fileValue.length);

    if (standardedExtensionFile.includes(filename) == false)
    {
        document.getElementById("messImportQuestion").textContent
                = 'file input is not a excel';
        return false;
    }



    if (fi.files[0].size > 1048576)
    {
        document.getElementById("messImportQuestion").textContent
                = 'size of file inputed comes over 1KB ';
        return false;
    }
}

function validEditQuiz() {
    
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
            document.getElementById("messCreatePractice").textContent
                    = 'file input is not a image';
            return false;
        }



        if (fi.files[0].size > 1048576)
        {
            document.getElementById("messCreatePractice").textContent
                    = 'size of image inputed comes over 1KB ';
            return false;
        }
    }

    // valid title
    let title = document.forms["myForm"]["title"].value;
    if (title.length > 100) {
        document.getElementById("messCreatePractice").textContent = "title comes over 100 characters";
        return false;
    }

    // valid description
    let description = document.forms["myForm"]["description"].value;
    if (description.length > 50) {
        document.getElementById("messCreatePractice").textContent = "description comes over 50 characters";
        return false;
    }

    // valid duration
    let duration = document.forms["myForm"]["duration"].value;
    if (Number.isInteger(parseInt(duration)) === false) {
        document.getElementById("messCreatePractice").textContent = "duration is not a number";
        return false;
    }

    if (parseInt(duration) < 0)
    {
        document.getElementById("messCreatePractice").textContent = "duration is not a positive number";
        return false;
    }

    if (parseInt(duration) > 10800)
    {
        document.getElementById("messCreatePractice").textContent = "duration is out of boundary, (limit of duration is 10800 seconds)";
        return false;
    }

}