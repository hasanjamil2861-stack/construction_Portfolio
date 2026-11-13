// backend address (xampp)
export const API_URL = "http://localhost/construction_Portfolio/backend/api";

// images folder address
export const UPLOADS_URL = "http://localhost/construction_Portfolio/backend/uploads";

// get data from any api file
export async function getData(endpoint) {
  const response = await fetch(`${API_URL}/${endpoint}`);

  // stop if the server returned an error
  if (!response.ok) {
    throw new Error("Failed to load " + endpoint);
  }

  // convert the json to a javascript object
  return response.json();
}