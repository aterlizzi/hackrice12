import dotenv from "dotenv";
dotenv.config();
import express from "express";
import firebaseConfig from "./config/firebase.config.js";
import bodyParser from "body-parser";
import login from "./routes/login.route.js";
import { cert } from "firebase-admin/app";
import { initializeApp } from "firebase-admin/app";
import { createRequire } from "module";
import door from "./routes/door.route.js";
const require = createRequire(import.meta.url);
const serviceAccount = require("./config/hackrice12-ff24e99572b8.json");

// Initialize Firebase App
initializeApp({ credential: cert(serviceAccount) });

// Initialize Express App
const app = express();

app.use(bodyParser.json());
app.use("/login", login);
app.use("/door", door);
app.listen(3000, () => {
  console.log("Server is up and running.");
});

export { app };
