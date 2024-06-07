import React from "react";
import { Container, Row, Col } from "reactstrap";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { useAuth } from "@/helpers/auth/AuthContext";

const TopBarDark = ({ topClass, fluid }) => {
  const router = useRouter();
  const { sessionToken } = useAuth();
  console.log("sessionToken::", sessionToken);

  const Logout = () => {
    
    router.push("/");
  };
  return (
    <div className={topClass}>
      <Container fluid={fluid}>
        <Row>
          <Col lg="6">
            <div className="header-contact">
              <ul>
                <li>Welcome to Our store Multikart</li>
                <li>
                  <i className="fa fa-phone text-white" aria-hidden="true"></i>
                  Call Us: 123 - 456 - 7890
                </li>
              </ul>
            </div>
          </Col>
          <Col lg="6" className="text-end">
            <ul className="header-dropdown">
              <li className="mobile-wishlist">
                <Link href="/account/wishlist">
                  <i className="fa fa-heart" aria-hidden="true"></i> wishlist
                </Link>
              </li>
              <li className="onhover-dropdown mobile-account">
                <i className="fa fa-user" aria-hidden="true"></i> My Account
                <ul className="onhover-show-div">
                  {sessionToken ? (
                    <>
                      <li>
                        <Link href={`/account/login`}>Login</Link>
                      </li>
                      <li>
                        <Link href={`/account/register`}>Register</Link>
                      </li>
                    </>
                  ) : (
                    <>
                      <li onClick={() => Logout()}>
                        <Link href={`/account/dashboard`}>My Account</Link>
                      </li>
                      <li onClick={() => Logout()}>
                        <a>Logout</a>
                      </li>
                    </>
                  )}
                </ul>
              </li>
            </ul>
          </Col>
        </Row>
      </Container>
    </div>
  );
};

export default TopBarDark;
