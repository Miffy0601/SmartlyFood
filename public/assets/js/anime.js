// fadeIn animation
document.addEventListener("DOMContentLoaded", function(){
    new addAminateClass('.anime');
})

class addAminateClass {
    constructor(property){
        const cb = function(entries, observer){
            entries.forEach(entry => {
                if(entry.isIntersecting){
                    entry.target.classList.add('animated');
                }
            });
        }
        this.DOM = {};
        this.DOM.pps = document.querySelectorAll(property);
        this.DOM.io = new IntersectionObserver(cb);
        this.DOM.pps.forEach(pp => this.DOM.io.observe(pp));
    }
}

