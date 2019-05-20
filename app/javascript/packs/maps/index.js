document.addEventListener("turbolinks:load", function() {
  var map = new GMaps({
    div: "#map",
    lat: 34.052235,
    lng: -118.2437
  });
  window.map = map;

  var bounds = new google.maps.LatLngBounds();

  var markers = JSON.parse(document.querySelector("#map").dataset.places);
  window.markers = markers;

  markers.forEach(function(place) {
    if (place.latitude && place.longitude) {
      var marker = map.addMarker({
        lat: place.latitude,
        lng: place.longitude,
        title: place.address,
        infoWindow: {
          content: `<p><a>${place.address}</a></p>`
        }
      });
      bounds.extend(marker.position);
    }
  });
  map.fitBounds(bounds);
});
