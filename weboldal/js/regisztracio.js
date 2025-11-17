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

let nev = document.getElementById("nev");
let reg = document.getElementById("reg");
let hiba = document.getElementById("hiba");

reg.addEventListener("click", function(){
    if (nev.value.trim() === "" || jelszoReg.value.trim() === "" || jelszoRegUjra.value.trim() === "" ){
        hiba.innerText = "Minden mezőt töltsön ki!";
    }
    else{
        hiba.innerText = "";
    }
    if(jelszoReg.value.trim() !== jelszoRegUjra.value.trim()){
        hiba.innerText = "A két jelszó meg kell egyezzen!";
    }
})
