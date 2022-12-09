
function checkUsername(inputElement)  {
    inputElement.classList.remove('is-invalid');
    inputElement.classList.remove('is-valid');
    inputElement.value = inputElement.value.replace(/\s/gi, "");

    const regex = /^[a-z0-9]{4,30}$/;
    if(regex.test(inputElement.value)) {
        inputElement.className += ' is-valid';
        return true;
    } else {
        inputElement.className += ' is-invalid';
        return false;
    }
}

function checkPassword(inputElement)  {
    inputElement.classList.remove('is-invalid');
    inputElement.classList.remove('is-valid');
    inputElement.value = inputElement.value.replace(/\s/gi, "");

    const regex = /^[a-zA-Z\\d`~!@#$%^&*()-_=+]{8,30}$/;
    if(regex.test(inputElement.value)) {
        inputElement.className += ' is-valid';
        return true;
    } else {
        inputElement.className += ' is-invalid';
        return false;
    }
}