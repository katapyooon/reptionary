document.addEventListener('turbo:load', function() {
    document.addEventListener('ajax:success', function(event) {
      const [data, status, xhr] = event.detail;
      if (xhr.responseURL.includes('/my_reptiles/') && xhr.status === 204) {
        const reptileId = xhr.responseURL.split('/').pop();
        const element = document.getElementById(`reptile-${reptileId}`);
        if (element) {
          element.remove();
        }
      }
    });
  });