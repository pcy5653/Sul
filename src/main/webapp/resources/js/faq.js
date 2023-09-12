const frm = document.getElementsByClassName('frm');
const c1 = document.getElementsByClassName('c1');

const nn = document.getElementsByClassName("faqIn");
for(n of nn){
    console.log("num value :",n.value)
}

//1. 수정, 삭제 btn 클릭 시 변경
for (let i = 0; i < c1.length; i++) {
    c1[i].addEventListener("click", function() {
        const index = i; // index 고정
        let url = this.getAttribute("data-url");
        //let val = c1[index].getAttribute("data-num");

        if (url == '/faq/delete') {
            let check = confirm("정말로 삭제하시겠습니까?");
            if (check) {

                // frm[index].method = "POST";
                // frm[index].action = url;
                // frm[index].submit();
                console.log("delbtn : ",c1[index]);
                console.log("del : ",frm[index]);
            } else {
                return;
            }
        }

        if (url == '/faq/update') {
            let check = confirm("이 글을 수정하시겠습니까?");
            if (check) {
                // frm[index].action = url;
                // frm[index].submit();
                console.log("upbtn : ",c1[index]);
                console.log("up : ",frm[index]);
            } else {
                return;
            }
        }
    });
}(i);



