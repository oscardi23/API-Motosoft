/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */


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
  
        