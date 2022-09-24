import express from "express";
import { verifyGoogleUser } from "../controllers/login.controller.js";

const login = express.Router();

login.use("/verify", verifyGoogleUser);

export default login;
