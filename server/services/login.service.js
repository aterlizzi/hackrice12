import { getFirestore } from "firebase-admin/firestore";

export const verifyUserInDatabase = async (email) => {
  console.log(email);
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
