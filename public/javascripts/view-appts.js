document.addEventListener("DOMContentLoaded", () => {
    const viewAppts = document.querySelector("#view-user-appointments");

    viewAppts.addEventListener("click", (e) => {
        e.preventDefault();

        window.location = `/my-bookfit-appts`
    })

});