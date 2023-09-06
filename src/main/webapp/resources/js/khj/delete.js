
let del = document.getElementById("del");
const c1 = document.getElementsByClassName("c1");
const frm = document.getElementById("frm");
let reviewDel = document.getElementById("reviewDel");

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


reviewDel.addEventListener("click", function(){
    let result = confirm("리뷰를 삭제 하시겠습니까?");
    if(result){
    	reviewNum=reviewDel.getAttribute("data-delete-num")
        let parameterName=reviewDel.getAttribute("data-delete-name");

        location.href="../product/reviewDelete?"+parameterName+"="+reviewNum;
    }
}); 
