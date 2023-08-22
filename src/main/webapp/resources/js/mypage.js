$("#infoBtn").click(function(){
    
    fetch("info",{
        method:"get"
    })
    .then((response)=> response.text())
    .then((r)=>
        $("#page").html(r)
    )
})
//jquery로하면 오류뜸 추가할때 fetch로 추가
