const frm = document.getElementsByClassName('frm');
const c1 = document.getElementsByClassName('c1');

const nn = document.getElementsByClassName("faqIn");
for(n of nn){
    console.log("num value :",n.value)
}

//1. 수정, 삭제 btn 클릭 시 변경
for (let i = 0; i < c1.length; i++) {
    c1[i].addEventListener("click", function() {
        let url = this.getAttribute("data-url");
        

        if (url == '/faq/delete') {
            let check = confirm("정말로 삭제하시겠습니까?");
            if (check) {
                frm[i].method = "POST";
                frm[i].action = url;
                frm[i].submit();
            } else {
                return;
            }
        }

        if (url == '/faq/update') {
            let check = confirm("이 글을 수정하시겠습니까?");
            if (check) {
                frm[i].action = url;
                frm[i].submit();
            } else {
                return;
            }
        }
    });
}


// const c1 = document.querySelectorAll('.c1');
// c1.forEach(button => {
//     button.addEventListener("click", function() {
//         let url = this.getAttribute("data-url");
//         let formId = this.getAttribute("data-form-id");
//         let form = document.getElementById(formId); // Get the form by its ID
        
//         if (url == '/faq/delete') {
            
           
//         let check = confirm("정말로 삭제하시겠습니까?");
//         if (check) {
//             form.method = 'post';
//             form.action = url; // Set the form action to the delete URL
//             form.submit();
//             }else {
//                 return;
//             }
//         }

//         if (url == '/faq/update') {
//             let check = confirm("이 글을 수정하시겠습니까?");
//             if (check) {
//                 form.action = url;
//                 form.submit();
//             }else {
//                 return;
//             }
//         }
//     });
// });

