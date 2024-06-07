"use client";

import { createContext, useContext, useState } from "react";

const AuthContext = createContext({
  sessionToken: "",
  setSessionToken: (session) => {}
});

export const useAuth = () => {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error("useAuth must be used within an AuthProvider");
  }
  return context;
};

export default function AuthProvider({ children, initialSessionToken = '' }) {
  const [sessionToken, setSessionToken] = useState(initialSessionToken);
  return (
    <AuthContext.Provider value={{ sessionToken, setSessionToken }}>
      {children}
    </AuthContext.Provider>
  );
}
