const counter = document.querySelector(".counter");
async function updateCounter() {
  let response = await fetch("https://tsrp67vgoohuhzg3iwxgyssody0jhhfj.lambda-url.us-west-1.on.aws/");
  let data = await response.json();
  counter.innerHTML = `${data}`;
}

updateCounter();