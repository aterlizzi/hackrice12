import express from "express";
import openDoor from "../controllers/door.controller.js";

const door = express.Router();

door.use("/open", openDoor);

export default door;
