let validateRu = document.querySelectorAll('.validate-ru');
let validateEn = document.querySelectorAll('.validate-en');

const validate = (target, regular) => {
    target.forEach(input => {
        input.addEventListener('keyup', () => input.value = input.value.replace(regular, ''));
    });
}

validate(validateRu, /[^а-яА-Я- ]+/);
validate(validateEn, /[^a-zA-Z0-9-]+/);