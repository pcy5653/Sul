
let del = document.getElementById("del");
const c1 = document.getElementsByClassName("c1");
const frm = document.getElementById("frm");


for(c of c1){
    c.addEventListener("click", function(){
        let url = this.getAttribute("data-url");
        if(url == 'delete'){
            let result = window.confirm("정말 삭제하시겠습니까?");
            if(!result){
                return;
            }
            frm.method = 'post';
        }
        frm.action = url;
        frm.submit();
    });
}



