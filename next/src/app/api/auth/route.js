export async function POST(request) {
  const res = await request.json();

  const sessionToken = res?.metadata?.token;
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
    { res },
    {
      status: 200,
      headers: { "Set-Cookie": `sessionToken=${res.metadata.token}; Path=/; HttpOnly` },
    }
  );
}
