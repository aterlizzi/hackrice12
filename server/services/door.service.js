import { getFirestore } from "firebase-admin/firestore";
import distanceBetweenCoordinates from "../utils/coordinateDistance.js";

export const openNearestDoor = async (coordinates, email) => {
  const db = getFirestore();
  const doorsSnapshot = await db.collection("doors").get();
  const userDoc = await db.collection("users").doc(email).get();

  if (!userDoc) return;
  const userPermission = userDoc.data().permissions;

  let minDistance = ["", Infinity, 99]; // (name, distance (in meters), permissions)
  doorsSnapshot.forEach((doc) => {
    const data = doc.data();
    const distance = distanceBetweenCoordinates(coordinates, [
      data.coordinates._longitude,
      data.coordinates._latitude,
    ]);
    if (minDistance[1] > distance) {
      minDistance = [data.name, distance, data.permissions];
    }
  });

  if (minDistance[1] > 5) {
    return {
      status: "failure",
      message: "You aren't close enough to any door.",
    };
  } else if (userPermission < minDistance[2]) {
    return {
      status: "noPermission",
      message: "You don't have permission to open this door.",
    };
  } else {
    return {
      status: "success",
      message: "Door successfully opened.",
    };
  }
};
