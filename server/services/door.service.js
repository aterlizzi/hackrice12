export const openNearestDoor = async (coordinates) => {
  const db = getFirestore();
  const doorsSnapshot = await db.collection("doors").get();
  doorsSnapshot.forEach((doc) => {
    const data = doc.data();
    console.log(data);
  });
};
