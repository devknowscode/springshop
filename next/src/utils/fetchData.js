import axios from "axios";

// Function to fetch data with authorization header
async function getData(url, token) {
  try {
    const response = await axios.get(url, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });
    console.log("Data:", response.data);
    return response.data;
  } catch (error) {
    console.error("Error fetching data:", error);
    // Handle error appropriately
    if (error.response) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx
      console.log("Response data:", error.response.data);
      console.log("Response status:", error.response.status);
      console.log("Response headers:", error.response.headers);
    } else if (error.request) {
      // The request was made but no response was received
      console.log("Request data:", error.request);
    } else {
      // Something happened in setting up the request that triggered an Error
      console.log("Error message:", error.message);
    }
  }
}

async function postData(url, token, data) {
  try {
    const response = await axios.post(url, data, {
      headers: {
        Authorization: `Bearer ${token}`,
        "Content-Type": "application/json",
      },
    });
    console.log("Data:", response.data);
    return response.data;
  } catch (error) {
    console.error("Error posting data:", error);
    // Handle error appropriately
  }
}

export { getData, postData };
