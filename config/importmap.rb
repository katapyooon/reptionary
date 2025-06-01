# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "controllers", preload: true
pin "cropperjs", to: "https://ga.jspm.io/npm:cropperjs@1.5.13/dist/cropper.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "controllers/my_reptiles_controller", preload: true
