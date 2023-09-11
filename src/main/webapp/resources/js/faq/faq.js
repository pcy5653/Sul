const frm = document.getElementsByClassName('frm');
const c1 = document.getElementsByClassName('c1');

const nn = document.getElementsByClassName("faqIn");
for(n of nn){
    console.log("num value :",n.value)
}

//1. 수정, 삭제 btn 클릭 시 변경
for(c of c1){
    c.addEventListener("click", function(){
        let url = this.getAttribute("data-url");
        console.log("누름")
        for(f of frm){
            if(url == '/faq/delete'){
                let check = confirm("정말로 삭제하시겠습니까?");
                if(check){
                    f.method='post';
                }else{
                    return;
                }
            }
            if(url == '/faq/update'){
                let check = confirm("이 글을 수정하시겠습니까?");
                if(check){
                    f.action=url;
                    f.submit();
                }
            }
        }
    });
}
