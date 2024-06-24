"use client";

import { createContext, useContext, useState } from "react";

const AuthContext = createContext({
  sessionToken: "",
  setSessionToken: (session) => {},
  clearSessionToken: () => {}
});

export const useAuth = () => {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error("useAuth must be used within an AuthProvider");
  }
  return context;
};

export default function AuthProvider({ children, initialSessionToken = '' }) {
  const [sessionToken, setSessionTokenState] = useState(initialSessionToken);

  const setSessionToken = (session) => {
    setSessionTokenState(session);
    if (session) {
      localStorage.setItem('userToken', session);
    } else {
      localStorage.removeItem('userToken');
    }
  };

  const clearSessionToken = () => {
    setSessionTokenState('');
    localStorage.removeItem('userToken');
  };

  return (
    <AuthContext.Provider value={{ sessionToken, setSessionToken, clearSessionToken }}>
      {children}
    </AuthContext.Provider>
  );
}
