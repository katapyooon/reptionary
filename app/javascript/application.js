import "@hotwired/turbo-rails"
import "controllers"
import Cropper from 'cropperjs'
import { initializeCropper } from './crop'

document.addEventListener("turbo:load", () => {
  initializeCropper();
});