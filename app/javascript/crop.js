import Cropper from 'cropperjs';

export function initializeCropper() {
  const imageUpload = document.getElementById("image-upload");
  const cropperImage = document.getElementById("cropper-image");
  const circleImage = document.getElementById("circle-image");
  const modal = document.getElementById("crop-modal");
  const closeButton = document.querySelector(".close-button");
  const saveButton = document.getElementById("save-crop");
  let cropper = null;

  if (!imageUpload || !cropperImage || !modal) {
    console.error("Required elements not found");
    return;
  }

  imageUpload.addEventListener("change", (event) => {
    const file = event.target.files[0];
    if (file) {
      const reader = new FileReader();
      
      reader.onload = (e) => {
        modal.style.display = "block";
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
          autoCropArea: 0.8,
          ready() {
            // 初期クロップ領域のデータを設定
            const initialData = cropper.getData();
            updateCropFields(initialData);
          }
        });
      };

      reader.readAsDataURL(file);
    }
  });

  function updateCropFields(data) {
    const cropX = document.getElementById('my_reptile_crop_x');
    const cropY = document.getElementById('my_reptile_crop_y');
    const cropWidth = document.getElementById('my_reptile_crop_width');
    const cropHeight = document.getElementById('my_reptile_crop_height');

    if (cropX && cropY && cropWidth && cropHeight) {
      cropX.value = Math.round(data.x);
      cropY.value = Math.round(data.y);
      cropWidth.value = Math.round(data.width);
      cropHeight.value = Math.round(data.height);
      console.log('Crop fields updated:', {
        x: cropX.value,
        y: cropY.value,
        width: cropWidth.value,
        height: cropHeight.value
      });
    }
  }

  saveButton.addEventListener("click", function(event) {
    event.preventDefault();
    event.stopPropagation();
    
    if (cropper) {
      const data = cropper.getData();
      
      const canvas = cropper.getCroppedCanvas({
        width: 150,
        height: 150
      });
      
      // Base64形式の画像データを取得
      const imageData = canvas.toDataURL('image/jpeg');
      
      // プレビュー画像を更新
      circleImage.src = imageData;
      circleImage.style.display = "block";
  
      // hidden fieldsの更新
      document.getElementById('my_reptile_crop_x').value = Math.round(data.x);
      document.getElementById('my_reptile_crop_y').value = Math.round(data.y);
      document.getElementById('my_reptile_crop_width').value = Math.round(data.width);
      document.getElementById('my_reptile_crop_height').value = Math.round(data.height);
  
      // モーダルを閉じる
      modal.style.display = "none";
    }
  });

  closeButton.addEventListener("click", () => {
    modal.style.display = "none";
  });

  // モーダル外クリックで閉じる
  window.onclick = (event) => {
    if (event.target === modal) {
      modal.style.display = "none";
    }
  };
}