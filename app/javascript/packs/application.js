// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('./nested-forms/addFields')
require('./nested-forms/removeFields')




// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import AOS from 'aos';
// import { Calendar } from '@fullcalendar/core';
// import dayGridPlugin from '@fullcalendar/daygrid';


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
   AOS.init();
  // var calendarEl = document.getElementById('calendar');
  // var calendar = new Calendar(calendarEl, {
  //   plugins: [ dayGridPlugin ],
  //   contentHeight: 300,
  //   events: [
  //   {
  //     title  : 'event1',
  //     start  : '2020-07-04'
  //   },
  //   {
  //     title  : 'event2',
  //     start  : '2010-01-05',
  //     end    : '2010-01-07'
  //   },
  //   {
  //     title  : 'event3',
  //     start  : '2010-01-09T12:30:00',
  //     allDay : false // will make the time show
  //   }
  // ]
  // });
  // calendar.render();
  //  // initSelect2();
});




// const eventCalendar() {
//   return $('#calendar').fullCalendar({ });
// };

// const clearCalendar() {
//   $('#calendar').fullCalendar('delete');
//   $('#calendar').html('');
// };

// $(document).ready(function() {
//   $("#calendar").fullCalendar();
// });
//({startEvent: 'DOMContentLoaded'})
//startEvent: 'DOMContentLoaded'

//easing: 'ease-out-back',
   //duration: 800,
   //delay: 300,
   //once: true,
   //disable: 'mobile'
