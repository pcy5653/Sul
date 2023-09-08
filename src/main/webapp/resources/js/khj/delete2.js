const c1 = document.getElementsByClassName("c1");


for (c of c1) {
    c.addEventListener("click", function () {
        let result = confirm("리뷰를 삭제 하시겠습니까?");
        if (result) {
            let reviewNum = this.getAttribute("data-delete-num"); // 현재 클릭된 요소의 속성 값을 가져옴
            let parameterName = this.getAttribute("data-delete-name"); // 현재 클릭된 요소의 속성 값을 가져옴
            let parameterName2 = this.getAttribute("data-delete-name2");
            let reviewNum2 = this.getAttribute("data-delete-num2");

            // 새로운 URL로 이동
            window.location.href = "../product/reviewDelete?" + parameterName + "=" + reviewNum + "&" + parameterName2 + "=" + reviewNum2;
        }
    });
}