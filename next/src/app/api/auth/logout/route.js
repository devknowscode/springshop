import { cookies } from "next/headers";

export async function POST(request) {
    const cookieStore = cookies()
    const sessionToken = cookieStore.get('sessionToken')
    if (!sessionToken) {
      return Response.json(
        {
          message: "Không nhận được session token",
        },
        {
          status: 400,
        }
      );
    }
    return Response.json(
      { message: "Logged out successfully" },
      {
        status: 200,
        headers: { "Set-Cookie": "sessionToken=; Path=/; HttpOnly; Max-Age=0" },
      }
    );
  }
  