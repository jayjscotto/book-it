document.addEventListener("DOMContentLoaded", function(e) {

    $(document).on('click', '.appointment-modal', function(e) {
        const classId = e.target.getAttribute('data-id');
        console.log('hey')
        $.get('/api/class-info/' + classId).then((data) => {
            
            console.log(data);
        });;
    })
    
});