'use client'

import React, { useEffect } from "react";
import NavBar from "./common/navbar";
import Cart from "../containers/Cart";
import CartContainer from "../containers/CartContainer";
import TopBar from "./common/topbar";
import { Media, Container, Row, Col } from "reactstrap";
import LogoImage from "./common/logo";
import search from "/public/assets/images/icon/search.png";
import settings from "/public/assets/images/icon/setting.png";
import cart from "/public/assets/images/icon/cart.png";
import Currency from "./common/currency";
import { useRouter } from "next/navigation";
import SearchOverlay from "./common/search-overlay";

const HeaderOne = ({
  logoName,
  headerClass,
  topClass,
  noTopBar,
  direction,
}) => {
  const router = useRouter();

  /*=====================
     Pre loader
     ==========================*/
  useEffect(() => {
    setTimeout(function () {
      document.querySelectorAll(".loader-wrapper").style = "display:none";
    }, 2000);
  }, []);

  const openSearch = () => {
    document.getElementById("search-overlay").style.display = "block";
  };

  // eslint-disable-next-line
  const load = () => {
    setIsLoading(true);
    fetch().then(() => {
      // deal with data fetched
      setIsLoading(false);
    });
  };

  return (
    <div>
      <header id="sticky" className={`sticky ${headerClass}`}>
        <div className="mobile-fix-option"></div>
        {/*Top Header Component*/}
        {noTopBar ? "" : <TopBar topClass={topClass} />}

        <Container>
          <Row>
            <Col>
              <div className="main-menu">
                <div className="menu-left">
                  <div className="brand-logo">
                    <LogoImage logo={logoName} />
                  </div>
                </div>
                <div className="menu-right pull-right">
                  {/*Top Navigation Bar Component*/}
                   <NavBar />

                  <div>
                    <div className="icon-nav">
                      <ul>
                        <li className="onhover-div mobile-search">
                          <div>
                            <Media
                              src={search.src}
                              onClick={openSearch}
                              className="img-fluid"
                              alt=""
                            />
                            <i
                              className="fa fa-search"
                              onClick={openSearch}
                            ></i>
                          </div>
                        </li>
                        <Currency icon={settings.src} />
                        {/*Header Cart Component */}
                        {direction === undefined ? (
                          <CartContainer layout={direction} icon={cart.src} />
                        ) : (
                          
                          <Cart layout={direction} icon={cart.src} />
                        )}
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </Col>
          </Row>
        </Container>
      </header>

      <SearchOverlay />
    </div>
  );
};

export default HeaderOne;
