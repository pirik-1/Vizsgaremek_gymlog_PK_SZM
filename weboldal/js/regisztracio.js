let mutasdReg = document.getElementById("mutasdReg");
let jelszoReg = document.getElementById("jelszoReg");
let jelszoRegUjra = document.getElementById("jelszoRegUjra");

mutasdReg.addEventListener("mouseover", function(){
    jelszoReg.type = "text";
    jelszoRegUjra.type = "text";
    mutasdReg.style.color = "lightblue";
})
mutasdReg.addEventListener("mouseout", function(){
    jelszoReg.type = "password";
    jelszoRegUjra.type = "password";
    mutasdReg.style.color = "white";
})


