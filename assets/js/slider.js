let viewport = document.getElementById('viewport').offsetWidth;
let btnNext = document.querySelector('.next');
let btnPrev = document.querySelector('.prev');
let slider = document.querySelector('div.slider');

let index = 0;

const next = () => {
    index < 4 ? index++ : index = 0;
    slider.style.left = -index * viewport + 'px';
}

const prev = () => {
    index > 0 ? index-- : index = 4;
    slider.style.left = -index * viewport + 'px';
}

window.addEventListener('DOMContentLoaded', () => setInterval(() => next(), 3500));
btnNext.addEventListener('click', () => next());
btnPrev.addEventListener('click', () => prev());