import Cropper from 'cropperjs';

export function initializeCropper() {
  const imageUpload = document.getElementById("image-upload");
  const cropperImage = document.getElementById("cropper-image");
  const circleImage = document.getElementById("circle-image");
  let cropper;

  if (imageUpload) {
    imageUpload.addEventListener("change", (event) => {
      const file = event.target.files[0];
      if (file) {
        const reader = new FileReader();
        reader.onload = (e) => {
          cropperImage.src = e.target.result;
          cropperImage.style.display = "block";

          if (cropper) {
            cropper.destroy();
          }

          cropper = new Cropper(cropperImage, {
            aspectRatio: 1,
            viewMode: 1,
            preview: '.circle-frame',
            dragMode: 'move',
            guides: true,
            center: true,
            cropBoxMovable: true,
            cropBoxResizable: true,
            autoCropArea: 1,
            responsive: true,
            crop(event) {
              document.querySelector("input[name='my_reptile[crop_x]']").value = event.detail.x;
              document.querySelector("input[name='my_reptile[crop_y]']").value = event.detail.y;
              document.querySelector("input[name='my_reptile[crop_width]']").value = event.detail.width;
              document.querySelector("input[name='my_reptile[crop_height]']").value = event.detail.height;
            },
          });
        };
        reader.readAsDataURL(file);
      }
    });
  }
}