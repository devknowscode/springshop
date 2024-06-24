/** @type {import('next').NextConfig} */

const nextConfig = {
  env: {
    API_URL: "https://multikart-graphql-reactpixelstrap.vercel.app/server.js",
    IMAGE_SERVER_URL: "http://localhost:8088/v1/api/products/image/"
  },

  // if you want to run with local graphQl un-comment below one and comment the above code
  // env: {
  //   API_URL: "http://localhost:4000/graphql",
  // },
  reactStrictMode: true,
};

export default nextConfig;
