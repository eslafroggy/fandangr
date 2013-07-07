// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(function () {
  $("td").on("click", function (event) {
    var table, movieID, showtimeID, seat, seatRow, seatNumber;

    event.preventDefault();

    seat = $(this);
    seatRow = seat.data("row");
    seatNumber = seat.data("seat-number");

    table = seat.closest("table");
    movieID = table.data("movie-id");
    showtimeID = table.data("showtime-id");

    jqXHR = $.post("/movies/" + movieID + "/showtimes/" + showtimeID + "/purchase", {
      row: seatRow,
      "seat_number": seatNumber
    }).done(function () {
      seat.attr("class", "error").text("Purchased");
    }).fail(function () {
      alert("Seat cannot be purchased.");
    });
  });
});