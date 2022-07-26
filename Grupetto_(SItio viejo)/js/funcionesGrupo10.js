//Esta funcion valida lo que ingresamos en el formulario
function Validar() {
    var nombrei, apellidoi, usuarioi, correoi; 

    nombrei = document.getElementById("nombre").value;
    apellidoi = document.getElementById("apellido").value;
    usuarioi = document.getElementById("usuario").value;
    correoi = document.getElementById("email").value;
 
    if(nombrei === "" || apellidoi === "" || usuarioi === "" || correoi === ""){
        alert('Complete todos los campos');
    }
    else if(nombrei.length < 3 || apellidoi.length< 3){
        alert('Deben ser mas de 3 o mas caracteres');
    }
    else{
        alert('el formulario se envió correctamente');
    }
    redireccion();


}
function redireccion(){
    alert('Seras redireccionado en 5 segundos');
    setTimeout(function(){
        location.href="index.html";
    },1000 * 5);
}


//calculadora de edad
const fechaNacimiento = document.getElementById("fechaNacimiento");
const edad = document.getElementById("edad");

const calcularEdad = (fechaNacimiento) => {
    const fechaActual = new Date();
    const anoActual = parseInt(fechaActual.getFullYear());
    const mesActual = parseInt(fechaActual.getMonth()) + 1;
    const diaActual = parseInt(fechaActual.getDate());

    // 2016-07-11
    const anoNacimiento = parseInt(String(fechaNacimiento).substring(0, 4));
    const mesNacimiento = parseInt(String(fechaNacimiento).substring(5, 7));
    const diaNacimiento = parseInt(String(fechaNacimiento).substring(8, 10));

    let edad = anoActual - anoNacimiento;
    if (mesActual < mesNacimiento) {
        edad--;
    } else if (mesActual === mesNacimiento) {
        if (diaActual < diaNacimiento) {
            edad--;
        }
    }
    return edad;
};

window.addEventListener('load', function () {

    fechaNacimiento.addEventListener('change', function () {
        if (this.value) {
            edad.innerText = `La edad es: ${calcularEdad(this.value)} años`;
        }
    });

});

// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
    'use strict';
    window.addEventListener('load', function() {
      // Fetch all the forms we want to apply custom Bootstrap validation styles to
      var forms = document.getElementsByClassName('needs-validation');
      // Loop over them and prevent submission
      var validation = Array.prototype.filter.call(forms, function(form) {
        form.addEventListener('submit', function(event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }
          form.classList.add('was-validated');
        }, false);
      });
    }, false);
})();
