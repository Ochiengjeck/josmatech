// Initialize Swiper
const caseStudiesSwiper = new Swiper('.case-studies-swiper', {
    slidesPerView: 1,
    spaceBetween: 30,
    loop: true,
    pagination: {
        el: '.swiper-pagination',
        clickable: true,
    },
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
    breakpoints: {
        768: {
            slidesPerView: 2,
        },
        1200: {
            slidesPerView: 3,
        }
    }
});

// Theme Toggle
const themeToggle = document.getElementById('theme-toggle');
const html = document.documentElement;

themeToggle.addEventListener('click', () => {
    if (html.getAttribute('data-theme') === 'dark') {
        html.removeAttribute('data-theme');
        themeToggle.innerHTML = '<i class="fas fa-moon"></i>';
    } else {
        html.setAttribute('data-theme', 'dark');
        themeToggle.innerHTML = '<i class="fas fa-sun"></i>';
    }
});

// Updated Mobile Navigation
const navToggle = document.getElementById('nav-toggle');
const navMenu = document.getElementById('nav-menu');
const navClose = document.getElementById('nav-close');
const overlay = document.getElementById('overlay');

navToggle.addEventListener('click', () => {
    navMenu.classList.add('active');
    overlay.classList.add('active');
    document.body.style.overflow = 'hidden'; // Prevent scrolling when menu is open
});

navClose.addEventListener('click', () => {
    navMenu.classList.remove('active');
    overlay.classList.remove('active');
    document.body.style.overflow = ''; // Re-enable scrolling
});

overlay.addEventListener('click', () => {
    navMenu.classList.remove('active');
    overlay.classList.remove('active');
    document.body.style.overflow = '';
});

// Updated Mega Menu for Mobile
const navItemsWithChildren = document.querySelectorAll('.nav-item-with-children');

navItemsWithChildren.forEach(item => {
    const link = item.querySelector('a');

    link.addEventListener('click', (e) => {
        if (window.innerWidth <= 992) {
            e.preventDefault();
            item.classList.toggle('active');

            // Close other open mega menus
            navItemsWithChildren.forEach(otherItem => {
                if (otherItem !== item && otherItem.classList.contains('active')) {
                    otherItem.classList.remove('active');
                }
            });
        }
    });
});

// Close menu when clicking on a link
document.querySelectorAll('.nav-menu a[href^="#"]').forEach(link => {
    link.addEventListener('click', () => {
        if (window.innerWidth <= 992) {
            navMenu.classList.remove('active');
            overlay.classList.remove('active');
            document.body.style.overflow = '';
        }
    });
});

// Chat Widget
const chatButton = document.getElementById('chat-button');
const chatContainer = document.getElementById('chat-container');
const chatClose = document.getElementById('chat-close');

chatButton.addEventListener('click', () => {
    chatContainer.classList.toggle('active');
});

chatClose.addEventListener('click', () => {
    chatContainer.classList.remove('active');
});

// Back to Top Button
const backToTop = document.getElementById('back-to-top');

window.addEventListener('scroll', () => {
    if (window.pageYOffset > 300) {
        backToTop.classList.add('active');
    } else {
        backToTop.classList.remove('active');
    }
});

backToTop.addEventListener('click', () => {
    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });
});

// Animated Counter
const statNumbers = document.querySelectorAll('.stat-number');
const animationDuration = 2000;
const frameDuration = 1000 / 60;
const totalFrames = Math.round(animationDuration / frameDuration);

const animateCountUp = (el) => {
    let frame = 0;
    const countTo = parseInt(el.getAttribute('data-count'), 10);
    const counter = setInterval(() => {
        frame++;
        const progress = frame / totalFrames;
        const currentCount = Math.round(countTo * progress);

        if (parseInt(el.innerHTML, 10) !== currentCount) {
            el.innerHTML = currentCount;
        }

        if (frame === totalFrames) {
            clearInterval(counter);
        }
    }, frameDuration);
};

const handleScroll = () => {
    statNumbers.forEach((statNumber) => {
        const rect = statNumber.getBoundingClientRect();
        const isVisible = rect.top < window.innerHeight && rect.bottom >= 0;

        if (isVisible && !statNumber.classList.contains('animated')) {
            statNumber.classList.add('animated');
            animateCountUp(statNumber);
        }
    });
};

window.addEventListener('scroll', handleScroll);
handleScroll();

// Background Animation
const bgAnimation = document.getElementById('bg-animation');
const particleCount = 15;

for (let i = 0; i < particleCount; i++) {
    const particle = document.createElement('div');
    particle.classList.add('bg-particle');

    const size = Math.random() * 100 + 50;
    const posX = Math.random() * 100;
    const posY = Math.random() * 100;
    const delay = Math.random() * 5;
    const duration = Math.random() * 10 + 10;

    particle.style.width = `${size}px`;
    particle.style.height = `${size}px`;
    particle.style.left = `${posX}%`;
    particle.style.top = `${posY}%`;
    particle.style.animationDelay = `${delay}s`;
    particle.style.animationDuration = `${duration}s`;

    bgAnimation.appendChild(particle);
}

// Custom Cursor
// const cursor = document.querySelector('.custom-cursor');

// document.addEventListener('mousemove', (e) => {
//     cursor.style.left = `${e.clientX}px`;
//     cursor.style.top = `${e.clientY}px`;
// });

// document.addEventListener('mouseover', (e) => {
//     if (e.target.matches('a, button, .cta-button, .secondary-button, .tab-button, .nav-toggle, .theme-toggle')) {
//         cursor.classList.add('active');
//     } else {
//         cursor.classList.remove('active');
//     }
// });

// Tab Navigation
const tabButtons = document.querySelectorAll('.tab-button');
const tabContents = document.querySelectorAll('.tab-content');

tabButtons.forEach(button => {
    button.addEventListener('click', () => {
        const tabId = button.getAttribute('data-tab');

        tabButtons.forEach(btn => btn.classList.remove('active'));
        tabContents.forEach(content => content.classList.remove('active'));

        button.classList.add('active');
        document.getElementById(`${tabId}-tab`).classList.add('active');
    });
});

// Preloader
window.addEventListener('load', () => {
    const preloader = document.querySelector('.preloader');
    if (preloader) {
        preloader.classList.add('fade-out');
        setTimeout(() => {
            preloader.style.display = 'none';
        }, 500);
    }
});
