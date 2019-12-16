$(function() {
  $(document).on("click", ".class-day-lookup", function(e) {
    e.preventDefault();

    //data attributes for URL
    const classDay = e.target.getAttribute("data-day");
    const businessId = e.target.getAttribute("data-business");

    window.location.pathname = "facility/facilityId=" + businessId + "/classes/" + classDay;
  });
});
