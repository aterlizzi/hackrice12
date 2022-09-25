import { openNearestDoor } from "../services/door.service.js";

const openDoor = async (req, res, next) => {
  const response = await openNearestDoor(req.body.coordinates, req.body.email);
  console.log(response);
  res.json(response);
};

export default openDoor;
