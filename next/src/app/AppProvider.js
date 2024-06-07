"use client";

import React, { useEffect, useState } from "react";
import { ToastContainer } from "react-toastify";
import TapTop from "../components/common/widgets/Tap-Top";
import CartContextProvider from "../helpers/cart/CartContext";
import { WishlistContextProvider } from "../helpers/wishlist/WishlistContext";
import FilterProvider from "../helpers/filter/FilterProvider";
import SettingProvider from "../helpers/theme-setting/SettingProvider";
import { CurrencyContextProvider } from "../helpers/Currency/CurrencyContext";
import Helmet from "react-helmet";

export default function AppProvider({ children, pageProps }) {
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    document.body.classList.add("light");

    let timer = setTimeout(function () {
      setIsLoading(false);
    }, 1000);
    return () => {
      clearTimeout(timer);
    };
  }, []);

  return (
    <>
      {isLoading ? (
        <div className="loader-wrapper">
          <div className="loader"></div>
        </div>
      ) : (
        <>
          <Helmet>
            <meta
              name="viewport"
              content="width=device-width, initial-scale=1"
            />
            <title>Multikart - Multi-purpopse E-commerce React Template</title>
          </Helmet>
          <div>
            <SettingProvider>
              <CurrencyContextProvider>
                  <CartContextProvider>
                    <WishlistContextProvider>
                      <FilterProvider>
                        {children}
                      </FilterProvider>
                    </WishlistContextProvider>
                  </CartContextProvider>
              </CurrencyContextProvider>
            </SettingProvider>
            <ToastContainer />
            <TapTop />
          </div>
        </>
      )}
    </>
  );
}
