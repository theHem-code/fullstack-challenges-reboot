const batch = 490; // change to your own batch id
const url = `https://wagon-chat.herokuapp.com/${batch}/messages`;

// Your turn to code!

const refreshBtn = document.getElementById("refresh");
const messages = document.querySelector("#message-list");
const sendBtn = document.getElementById("sendBtn");
const content = document.getElementById("your-message");
const author = document.getElementById("your-name");

// first to select the element and then add an event
// event for refresh and event for submit
// refresh btn needs a GET request to read the existing comments
// submit btn needs a POST request to create new comments >> endpoints a the same in this case

const refreshChat = () => {
  fetch(url)
    .then((response) => response.json())
    .then((data) => {
      messages.innerHTML = ""; //deletes everything before the iteration so that i won't have any message double etc./
      data.messages.forEach((message) => {
        // innerHTML works only if u have an opening and closing Tag.example input tag is a selfclosing tag therefore it doenst work.
        const minutesAgo = Math.round(
          (new Date() - new Date(message.created_at)) / 60000
        );
        const fullMessage = `<li>${message.content} (posted <span class="date">${minutesAgo} minutes ago</span>) by ${message.author}</li>`;
        messages.insertAdjacentHTML("afterbegin", fullMessage); // to add this <li> to the unordered List in the HTML file
      });
    });
};

refreshBtn.addEventListener("click", refreshChat); //no parathesis beacuse i am not calling the function, just point to it.

// could also add a submit event on the whole 'form' element. here i put a click event on the 'send btn'
sendBtn.addEventListener("click", (event) => {
  event.preventDefault();
  fetch(url, {
    method: "POST", //define the request, GET is default
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ author: author.value, content: content.value }), //stringify puts "" around everything
  })
    .then((response) => response.json())
    .then((data) => {
      refreshChat(); // so that after posting a comment the chat gets refreshed and shown in the chatList
    });
});

document.addEventListener("DOMContentLoaded", refreshChat);
setInterval(refreshChat, 5000);

// HINT: after 1 hour LeWagon API gets refreshed and all messages are gone
