let del = document.getElementById("del");

del.addEventListener("click", function(){
    let result = confirm("삭제 하시겠습니까?");
    if(result){
    	productgNum=del.getAttribute("data-delete-num")
        let parameterName=del.getAttribute("data-delete-name");

        location.href="./delete?"+parameterName+"="+productgNum;
    }
}); 

