function checkUsername(inputElement)  {
    inputElement.classList.remove('is-invalid');

    const regex = /^[a-z0-9]{0,30}$/;
    if(!regex.test(inputElement.value)) {
        inputElement.className += ' is-invalid';
    }
}

function checkPassword(inputElement)  {
    inputElement.classList.remove('is-invalid');

    const regex = /^[a-zA-Z\\d`~!@#$%^&*()-_=+]{0,30}$/;
    if(!regex.test(inputElement.value)) {
        inputElement.className += ' is-invalid';
    }
}
