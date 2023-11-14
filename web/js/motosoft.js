document.addEventListener("DOMContentLoaded", function () {
    const menuIcon = document.getElementById("menu-icon");
    const menuItems = document.getElementById("menu-items");

    menuIcon.addEventListener("click", function () {
        menuItems.classList.toggle("open");
    });
});


// funcion agregar imagen a la cuenta de la sesion 
function uploadImage() {
        const imageUploadInput = document.getElementById('image-upload');
        const userImage = document.getElementById('user-image');

        imageUploadInput.addEventListener('change', function () {
            const file = imageUploadInput.files[0];
            if (file) {
                const reader = new FileReader();

                reader.onload = function (e) {
                    userImage.src = e.target.result;
                };

                reader.readAsDataURL(file);
            }
        });

        imageUploadInput.click(); // Abre el diálogo de selección de archivos cuando se hace clic en el botón
    }
  
        
    
// funcion scroll de la sesion de bienvenida contenedor de mensajes
const contenedor = document.querySelector('.contenedor-noticias');

    function desplazamientoAutomatico() {
        setInterval(() => {
         contenedor.scrollBy({
         
         top: 0,
         left: contenedor.offsetWidth,
         behavior: 'smooth'
        });
     }, 3000);
    }

desplazamientoAutomatico();