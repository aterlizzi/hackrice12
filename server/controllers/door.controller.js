import { openNearestDoor } from "../services/door.service.js";

const openDoor = async (req, res, next) => {
  const response = await openNearestDoor(req.body.coordinates);
  res.json(response);
};

export default openDoor;
