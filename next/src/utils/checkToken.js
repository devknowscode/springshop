import { jwtDecode } from "jwt-decode";

function isTokenExpired(token) {
  try {
    const decoded = jwtDecode(token);
    const currentTime = Date.now() / 1000; // Convert to seconds
    return decoded.exp < currentTime;
  } catch (error) {
    return true; // If there's an error decoding, treat the token as expired
  }
}

export { isTokenExpired };
