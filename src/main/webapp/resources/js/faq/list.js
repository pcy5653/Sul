const li = document.getElementsByClassName('.fqaKind');
const ak = document.getElementsByClassName('.aKind');

for(a of ak){
    a.addEventListener("click", function(event){
        event.preventDefault();
               
        const href = a.getAttribute('href');
    
        window.location.href = href;
    })
};