
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

function isNumeric(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}

function validAddSubject() {

    // valid title
    let title = document.forms["myForm"]["title"].value;
    if (title.length > 100) {
        document.getElementById("messAddSubject").textContent = "title comes over 100 characters";
        return false;
    }

    // valid price
    let price = document.forms["myForm"]["price"].value;

    if (isNumeric(price) === false)
    {
        document.getElementById("messAddSubject").textContent = "price is not a number";
        return false;
    }

    if (parseFloat(price) < 0)
    {
        document.getElementById("messAddSubject").textContent = "price must be a positive value";
        return false;
    }

    if (parseFloat(price) > Number.MAX_SAFE_INTEGER)
    {
        document.getElementById("messAddSubject").textContent = "price is out of boundary (limit is 9007199254740991)";
        return false;
    }

    // valid saleprice
    let salePrice = document.forms["myForm"]["salePrice"].value;

    if (salePrice)
    {
        if (isNumeric(salePrice) === false)
        {
            document.getElementById("messAddSubject").textContent = "sale price is not a number";
            return false;
        }

        if (parseFloat(salePrice) < 0)
        {
            document.getElementById("messAddSubject").textContent = "sale price must be a positive value";
            return false;
        }

        if (parseFloat(salePrice) > Number.MAX_SAFE_INTEGER)
        {
            document.getElementById("messAddSubject").textContent = "sale price is out of boundary (limit is 9007199254740991)";
            return false;
        }

        if (parseFloat(salePrice) > parseFloat(price))
        {
            document.getElementById("messAddSubject").textContent = "sale price must be less than price!";
            return false;
        }
    }

}


function validformDashboard() {
    let toDate = document.forms["myForm"]["dateTo"].value;
    let fromDate = document.forms["myForm"]["dateFrom"].value;

    if (fromDate > toDate)
    {
        document.getElementById("createStatistic").textContent = "from-date must be less than to-date";
        return false;
    }
    
    let arrayToDate = toDate.split("-");
    let arrayFromDate = fromDate.split("-");

    const oneDay = 24 * 60 * 60 * 1000; // hours*minutes*seconds*milliseconds
    let firstDate = new Date(arrayToDate[0], arrayToDate[1]-1, arrayToDate[2]);
    let secondDate = new Date(arrayFromDate[0], arrayFromDate[1]-1, arrayFromDate[2]);

    let diffDays = Math.round(Math.abs((firstDate - secondDate) / oneDay));
    
    if(diffDays > 30)
    {
       document.getElementById("createStatistic").textContent = "distant between two dates must be less than 30 days";
        return false; 
    }


}
