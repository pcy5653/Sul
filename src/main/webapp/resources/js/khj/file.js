{/* <div class="mb-3">
  	<label for="pic" class="form-label">사진첨부</label>
  	<input type="file" name="photos" class="form-control" id="pic" placeholder="사진을 첨부해주세요.">
</div>	 */}

const fileList = document.getElementById("fileList");
const fileAdd = document.getElementById("fileAdd");
const deletes = document.getElementsByClassName("deletes");

for(del of deletes){
    del.addEventListener("click", function(){
        let num = this.getAttribute("data-delete-num");
        let check = confirm("삭제시 복구가 불가능합니다.");
        if(check){
            fetch("./fileDelete?productImgNum="+num, {method:"GET"})
                .then((result)=>{return result.text()})
                .then((r)=>{
                    if(r.trim() == '1'){
                        this.previousSibling.previousSibling.remove();
                        this.remove();
                        count--;
                    }
                })
        }
    });
}

let max = 10;
let count = 0;
// if(deletes != null) {
//     count = deletes.length;
//     alert(count);
// }
let idx = 0;

fileList.addEventListener("click", function(event){
    let cl = event.target.classList;
    if(event.target.classList.contains("df")){
        let deleteId = event.target.getAttribute("data-id");
        document.getElementById(deleteId).remove();
        count--;
    }
})

fileAdd.addEventListener("click", function(){
    if(count >= max){
        alert("최대 10개까지 가능합니다.");
        return;
    }
    count++;

    //div
    let d = document.createElement("div");  //<div></div>
    let a = document.createAttribute("class"); //class=
    a.value = "mb-3"; //class = "mb-3"
    d.setAttributeNode(a); //<div class="mb-3">
    a = document.createAttribute("id");
    a.value = "file" + idx;
    d.setAttributeNode(a);
    
    //input
    let i = document.createElement("input");
    a = document.createAttribute("type");
    a.value = "file";
    i.setAttributeNode(a);

    a = document.createAttribute("class");
    a.value = "form-control";
    i.setAttributeNode(a);

    a = document.createAttribute("name");
    a.value = "photos";
    i.setAttributeNode(a);

    a = document.createAttribute("id");
    a.value = "pic";
    i.setAttributeNode(a);
    
    d.appendChild(i);

    let s = document.createElement("span");
    let t = document.createTextNode("X");
    a = document.createAttribute("class");
    a.value = "df"; //deleteFile
    s.setAttributeNode(a);
    s.appendChild(t);

    a = document.createAttribute("data-id");
    a.value = "file" + idx;
    s.setAttributeNode(a);

    d.appendChild(s);

    fileList.appendChild(d);
    idx++;
})


