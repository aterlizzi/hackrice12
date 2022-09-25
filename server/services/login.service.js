import { getFirestore } from "firebase-admin/firestore";
import distanceBetweenCoordinates from "../utils/coordinateDistance.js";

export const verifyUserInDatabase = async (email) => {
  console.log(
    distanceBetweenCoordinates(
      [-95.40191605830731, 29.71787169866097],
      [-95.4023016820948, 29.718585849840114]
    )
  );
  if (email == "")
    return {
      status: "failure",
      message: "This email is not authorized for this organization.",
    };
  const db = getFirestore();
  const user = await db.collection("users").doc(email);

  //   if the user doesn't exist in database.
  if (!user.docs) {
    const address = email.split("@").pop();
    if (address !== "rice.edu") {
      return {
        status: "failure",
        message: "This email is not authorized for this organization.",
      };
    }
    const data = {
      email,
      permissions: 0,
    };
    await db.collection("users").doc(email).set(data);
  }
  return {
    status: "success",
    message: "Successfully verified email.",
  };
};
