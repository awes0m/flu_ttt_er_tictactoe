// console.log("starting");
//dependencies
const express = require("express");
const http = require("http");
const mongoose = require("mongoose");

//initialized
const app = express();
const port = process.env.PORT || 3000;

var server = http.createServer(app);
const Room = require("./models/room");
var io = require("socket.io")(server);

// middleware- to manipulate data from client to server and vise versa
app.use(express.json());

const DB ="mongodb+srv://Somongoadmin:somongoadmin123@godly-cluster.cphca.mongodb.net/?retryWrites=true&w=majority"; // database instance link
//Socket connection
io.on("connection", (socket) => {
  console.log("Socket IO Connected!");

  //create room
  socket.on("createRoom", async ({ nickname }) => {
    console.log(nickname);
    console.log(socket.id);
    try {
      //room is created
    let room = new Room()
    let player = {
      socketID: socket.id,
      nickname,
      playerType:'X',
    };
    //player is stored in the room
    room.players.push(player);
    room.turn = player;
    // save to db
    room = await room.save();
    console.log(room);
    const roomId = room._id.toString();
    socket.join(roomId); 
    /// socket -> Manipulating data to yourself, 
    ///io -> send data to everyone
    io.to(roomId).emit('createRoomSuccess',room);// tell client room is created 
      
    } catch (error) {
      console.log(error);
    }
    

    // player is taken to next screen
  });

  //Join Room
});

// DB Connection
mongoose
  .connect(DB)
  .then(() => {
    console.log("db connection established");
  })
  .catch((e) => {
    console.error(e);
  }); // connect to database - its a Promise object ie like Future in Dart

server.listen(port, "0.0.0.0", () => {
  console.log(`Server online !  ----- listening on port ${port}`);
});
