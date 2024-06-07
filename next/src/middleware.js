import { NextResponse } from "next/server";

const authPath = ["/account/login", "/account/register"];
const privatePath = [
  "/account/dashboard",
  "/account/profile",
  "/account/cart",
  "/account/wishlist",
];

export function middleware(request) {
  const { pathname, origin } = request.nextUrl;
  const sessionToken = request.cookies.get("sessionToken");
  if (privatePath.some((path) => pathname.startsWith(path)) && !sessionToken) {
    return NextResponse.redirect(`${origin}/account/login`, request.url);
  }

  if (authPath.some((path) => pathname.startsWith(path)) && sessionToken) {
    return NextResponse.redirect(`${origin}`, request.url);
  }
  return NextResponse.next();
}

// See "Matching Paths" below to learn more
export const config = {
  matcher: [...privatePath, authPath],
};
