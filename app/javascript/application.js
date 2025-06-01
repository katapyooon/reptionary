import "@hotwired/turbo-rails"
import "controllers"
import Cropper from 'cropperjs'
import { initializeCropper } from './crop'
import "./controllers/my_reptiles_controller"

document.addEventListener("turbo:load", () => {
  initializeCropper();
});