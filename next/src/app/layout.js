import { Inter } from "next/font/google";
import "../../public/assets/scss/app.scss";
import AppProvider from "./AppProvider";
import Head from "next/head";
import AuthProvider from "@/helpers/auth/AuthContext";
import { cookies } from "next/headers";

const inter = Inter({ subsets: ["latin"] });

export const metadata = {
  title: "Homepage",
  description: "This is homepage of springshop",
};

export default function RootLayout({ children }) {
  const sessionToken = cookies().get("sessionToken");

  return (
    <html lang="en">
      <Head>
        <link
          href="https://fonts.googleapis.com/css2?family=Philosopher:ital,wght@0,400;0,700;1,400;1,700&display=swap"
          rel="stylesheet"
        ></link>
        <link
          href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900"
          rel="stylesheet"
        />
      </Head>
      <body className={inter.className}>
        <AuthProvider initialSessionToken={sessionToken?.value}>
          <AppProvider>{children}</AppProvider>
        </AuthProvider>
      </body>
    </html>
  );
}
