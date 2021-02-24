demo = {
  initDocumentationCharts: function() {
    if ($('#dailySalesChart').length != 0 && $('#websiteViewsChart').length != 0) {
      /* ----------==========     Daily Sales Chart initialization For Documentation    ==========---------- */

      dataDailySalesChart = {
        labels: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
        series: [
          [12, 17, 7, 17, 23, 18, 38]
        ]
      };

      optionsDailySalesChart = {
        lineSmooth: Chartist.Interpolation.cardinal({
          tension: 0
        }),
        low: 0,
        high: 50, // creative tim: we recommend you to set the high sa the biggest value + something for a better look
        chartPadding: {
          top: 0,
          right: 0,
          bottom: 0,
          left: 0
        },
      }

      var dailySalesChart = new Chartist.Line('#dailySalesChart', dataDailySalesChart, optionsDailySalesChart);

      var animationHeaderChart = new Chartist.Line('#websiteViewsChart', dataDailySalesChart, optionsDailySalesChart);
    }
  },

  initGoogleMaps: function() {
    var myLatlng = new google.maps.LatLng(40.748817, -73.985428);
    var mapOptions = {
      zoom: 13,
      center: myLatlng,
      scrollwheel: false, //we disable de scroll over the map, it is a really annoing when you scroll through page
      styles: [{
          "elementType": "geometry",
          "stylers": [{
            "color": "#f5f5f5"
          }]
        },
        {
          "elementType": "labels.icon",
          "stylers": [{
            "visibility": "off"
          }]
        },
        {
          "elementType": "labels.text.fill",
          "stylers": [{
            "color": "#616161"
          }]
        },
        {
          "elementType": "labels.text.stroke",
          "stylers": [{
            "color": "#f5f5f5"
          }]
        },
        {
          "featureType": "administrative.land_parcel",
          "elementType": "labels.text.fill",
          "stylers": [{
            "color": "#bdbdbd"
          }]
        },
        {
          "featureType": "poi",
          "elementType": "geometry",
          "stylers": [{
            "color": "#eeeeee"
          }]
        },
        {
          "featureType": "poi",
          "elementType": "labels.text.fill",
          "stylers": [{
            "color": "#757575"
          }]
        },
        {
          "featureType": "poi.park",
          "elementType": "geometry",
          "stylers": [{
            "color": "#e5e5e5"
          }]
        },
        {
          "featureType": "poi.park",
          "elementType": "labels.text.fill",
          "stylers": [{
            "color": "#9e9e9e"
          }]
        },
        {
          "featureType": "road",
          "elementType": "geometry",
          "stylers": [{
            "color": "#ffffff"
          }]
        },
        {
          "featureType": "road.arterial",
          "elementType": "labels.text.fill",
          "stylers": [{
            "color": "#757575"
          }]
        },
        {
          "featureType": "road.highway",
          "elementType": "geometry",
          "stylers": [{
            "color": "#dadada"
          }]
        },
        {
          "featureType": "road.highway",
          "elementType": "labels.text.fill",
          "stylers": [{
            "color": "#616161"
          }]
        },
        {
          "featureType": "road.local",
          "elementType": "labels.text.fill",
          "stylers": [{
            "color": "#9e9e9e"
          }]
        },
        {
          "featureType": "transit.line",
          "elementType": "geometry",
          "stylers": [{
            "color": "#e5e5e5"
          }]
        },
        {
          "featureType": "transit.station",
          "elementType": "geometry",
          "stylers": [{
            "color": "#eeeeee"
          }]
        },
        {
          "featureType": "water",
          "elementType": "geometry",
          "stylers": [{
            "color": "#c9c9c9"
          }]
        },
        {
          "featureType": "water",
          "elementType": "labels.text.fill",
          "stylers": [{
            "color": "#9e9e9e"
          }]
        }
      ]

    };
    var map = new google.maps.Map(document.getElementById("map"), mapOptions);

    var marker = new google.maps.Marker({
      position: myLatlng,
      title: "Hello World!"
    });

    // To add the marker to the map, call setMap();
    marker.setMap(map);
  }

}
function Suggest(e,ulName) {
  const filter = e.value.toUpperCase();
  const ul = document.getElementById(ulName);
  const li = ul.getElementsByTagName("li");
ul.display = "none";
  // Loop through all list items, and hide those who don't match the search query
  if(filter.length>0){
    let count = 0;
  for (let i = 0; i < li.length; i++) {
    if (li[i].innerHTML.toUpperCase().indexOf(filter) > -1) {
      if(count<3){ li[i].style.display = "block";}
      else{
        break;
      }
      count++;
    } else {
      li[i].style.display = "none";
    }
  }
}else{
  for (let i = 0; i < li.length; i++) {
    li[i].style.display = "none";
  }
}
}
function getValue(e,bind,ulName){
  document.getElementById(bind).value = e.innerHTML;
  const ul = document.getElementById(ulName);
  const li = ul.getElementsByTagName("li");
  for (let i = 0; i < li.length; i++) {
    li[i].style.display = "none";
  }
}
function InviteMember(){
  const role = document.getElementById("role").value;
  const email = document.getElementById("emailInput").value;
  if(!role || !email){
    return false;
  }else{
    document.getElementById('memberEmail').value = email;
    document.getElementById('memberRole').value = role;
  }
}
function getWiki(){
  document.getElementById('data').value = editor.getData();
}
function createSprint(){
  const name = document.getElementById("name").value;
  const start = document.getElementById("start").value;
  const end = document.getElementById("end").value;
  const description = document.getElementById("description").value;
  if(!name || !start || !end){
    return false;
  }else if((start-end)>=0){    return false;}
  else{
    document.getElementById('sprintName').value = name;
    document.getElementById('sprintStart').value = start;
    document.getElementById('sprintEnd').value = end;
    document.getElementById('sprintDescription').value = description;
  }
}
function bindEditSprint(id){
  const tr = document.getElementById(id);
  const td = tr.getElementsByTagName('td');
    document.getElementById("sp_name").value = td[1].innerHTML;
}