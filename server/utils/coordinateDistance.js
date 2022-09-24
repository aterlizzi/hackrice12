const convertToRadians = (val) => {
  const pi = 22 / 7;
  const dividend = 180 / pi;
  return val / dividend;
};

const distanceBetweenCoordinates = (coordsA, coordsB) => {
  // calculate using Haversine Formula --> coordA: (long, lat), returns distance in meters.
  const lonA = coordsA[0];
  const latA = coordsA[1];

  const lonB = coordsB[0];
  const latB = coordsB[1];

  const R = 6371; // km

  const xA = latB - latA;
  const dLat = convertToRadians(xA);
  const xB = lonB - lonA;
  const dLon = convertToRadians(xB);
  const a =
    Math.sin(dLat / 2) * Math.sin(dLat / 2) +
    Math.cos(convertToRadians(latA)) *
      Math.cos(convertToRadians(latB)) *
      Math.sin(dLon / 2) *
      Math.sin(dLon / 2);
  const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  let d = R * c;

  return d * 1000;
};

export default distanceBetweenCoordinates;
