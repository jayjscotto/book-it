
let user;

document.addEventListener('DOMContentLoaded', function(){
  // Handler when the DOM is fully loaded
  getUser();
  document.querySelector('.member-name').textContent = user
});

async function getUser() {
  const getuser = await fetch('/api/user_data', {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json'
    },
  });
  // console.log(getuser.status);
  // console.log(getuser.ok);  
  // console.log(getuser);
  // console.log(getuser.json())
  return getuser
}