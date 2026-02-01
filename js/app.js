// Sticky Navigation
window.addEventListener('scroll', function() {
  const nav = document.getElementById('nav');
  if (window.scrollY > 50) {
    nav.classList.add('sticky');
  } else {
    nav.classList.remove('sticky');
  }
});

// Back to Top Button
const backToTopBtn = document.getElementById('backToTopBtn');

window.addEventListener('scroll', function() {
  if (window.scrollY > 300) {
    backToTopBtn.style.display = 'flex';
  } else {
    backToTopBtn.style.display = 'none';
  }
});

backToTopBtn.addEventListener('click', function(e) {
  e.preventDefault();
  window.scrollTo({
    top: 0,
    behavior: 'smooth'
  });
});

// Smooth Scrolling
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
  anchor.addEventListener('click', function (e) {
    e.preventDefault();
    const target = document.querySelector(this.getAttribute('href'));
    if (target) {
      target.scrollIntoView({
        behavior: 'smooth',
        block: 'start'
      });
    }
  });
});

// Form Submission
const contactForm = document.getElementById('contact-form');
if (contactForm) {
  contactForm.addEventListener('submit', async function(e) {
    e.preventDefault();
    
    const btn = this.querySelector('.btn-email');
    btn.classList.add('loading');
    
    // Simulate form submission (replace with actual Formspree)
    setTimeout(() => {
      btn.classList.remove('loading');
      btn.classList.add('success');
      
      // Reset form
      contactForm.reset();
      
      // Reset button after 3 seconds
      setTimeout(() => {
        btn.classList.remove('success');
      }, 3000);
    }, 1500);
  });
}

// Project Cards Hover Effect
const projectRows = document.querySelectorAll('.project-row');
projectRows.forEach(row => {
  row.addEventListener('mouseenter', function() {
    this.style.transform = 'translateY(-5px)';
  });
  
  row.addEventListener('mouseleave', function() {
    this.style.transform = 'translateY(0)';
  });
});

// Mobile Menu Toggle (if needed)
const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
const mobileMenu = document.querySelector('.mobile-menu');

if (mobileMenuBtn && mobileMenu) {
  mobileMenuBtn.addEventListener('click', function() {
    mobileMenu.classList.toggle('active');
  });
}

// Animate skill icons on scroll
const skillsSection = document.getElementById('skills');
if (skillsSection) {
  const observerOptions = {
    threshold: 0.5
  };
  
  const observer = new IntersectionObserver(function(entries) {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.querySelectorAll('.skills-icons li').forEach((skill, index) => {
          setTimeout(() => {
            skill.style.opacity = '1';
            skill.style.transform = 'translateY(0)';
          }, index * 50);
        });
      }
    });
  }, observerOptions);
  
  observer.observe(skillsSection);
}

// Console message
console.log('%c👋 Bonjour ! Je suis Wendyam Ariel', 'font-size: 20px; color: #2563eb; font-weight: bold;');
console.log('%c🚀 Data Scientist passionné par l\'IA de confiance et le ML', 'font-size: 14px; color: #666;');
console.log('%c📧 wendyam-ariel.tiemtore@univ-lyon2.fr', 'font-size: 12px; color: #2563eb;');
