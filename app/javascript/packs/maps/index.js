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

document.addEventListener("turbolinks:load", function() {
  var map2 = new GMaps({
    div: "#map2",
    lat: 34.052235,
    lng: -118.2437,
    zoom: 11,
    zoomControl: true
  });
  window.map2 = map2;

  var bounds = new google.maps.LatLngBounds();

  var markers = JSON.parse(document.querySelector("#map2").dataset.places);
  window.markers = markers;

  var origin = JSON.parse(document.querySelector("#map2").dataset.origin);
  window.origin = origin;

  var destination = JSON.parse(document.querySelector("#map2").dataset.destination);
  window.destination = destination;

  console.log(origin, destination)

  GMaps.geolocate({
    success: function(position){
      map2.setCenter(origin.latitude, origin.longitude);
       map2.drawRoute({
        origin: [origin.latitude, origin.longitude],
        destination: [destination.latitude, destination.longitude],
        travelMode: 'driving',
        strokeColor: '#000',
        strokeOpacity: 0.6,
        strokeWeight: 6
      });
    },
    error: function(error){
      alert('Geolocation failed: '+error.message);
    },
    not_supported: function(){
      alert("Your browser does not support geolocation");
    }
  });

  markers.forEach(function(place) {
    if (place.latitude && place.longitude) {
      var marker = map2.addMarker({
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
  map2.fitBounds(bounds);
});
