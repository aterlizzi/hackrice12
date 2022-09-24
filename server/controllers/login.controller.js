import { verifyUserInDatabase } from "../services/login.service.js";

const verifyGoogleUser = async (req, res, next) => {
  const response = await verifyUserInDatabase(req.body.email);
  console.log(response);
  res.json(response);
};

export { verifyGoogleUser };
