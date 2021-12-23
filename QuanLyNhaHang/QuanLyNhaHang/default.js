document.addEventListener("DOMContentLoaded", function () {
    var nut = document.querySelectorAll('div.nut ul li');
    var slides = document.querySelectorAll('div.slide div');
    for (var i = 0; i < nut.length; i++) {
        nut[i].addEventListener('click', function () {
            var nutnay = this;
            var vitrislide = 0;
            console.log(nutnay.previousElementSibling);
            for (var i = 0; nutnay = nutnay.previousElementSibling; vitrislide++) {
            }
            for (var i = 0; i < slides.length; i++) {
                slides[i].classList.remove('ra');
            }
            for (var i = 0; i < slides.length; i++) {
                slides[vitrislide].classList.adsd('ra');
            }
        })
    }
    auto();
    function auto() {
        var thoigian = setInterval(function () {
            var slide = document.querySelector('div.slide div.ra');
            var vitrislide = 0;
            for (var i = 0; slide = slide.previousElementSibling; vitrislide++) {
            }
            for (var i = 0; i < slides.length; i++) {
                slides[i].classList.remove('ra'); 
            }
            if (vitrislide == slides.length - 1) {
                slides[0].classList.add('ra');
            }
            else {
                slides[vitrislide].nextElementSibling.classList.add('ra');
                // Đây là then chốt của auto slide nó sẽ chuyển sang cái thằng tiếp theo.
            }
        }, 2000)
    }
    var x = setInterval(function () {
        console.log('dm');
    }, 1000);

}, false)

