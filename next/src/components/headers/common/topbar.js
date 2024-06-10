import React from "react";
import { Container, Row, Col } from "reactstrap";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { useAuth } from "@/helpers/auth/AuthContext";
import axios from "axios";

const TopBarDark = ({ topClass, fluid }) => {
  const router = useRouter();
  const { sessionToken, clearSessionToken } = useAuth();

  const Logout = async () => {
    try {
      const response = await axios.post('/api/auth/logout', {
        metadata: {
          token: sessionToken
        }
      });
      if (response.status === 200) {
        clearSessionToken();
        router.push("/");
      } else {
        console.error('Error logging out:', response.data.message);
      }
    } catch (error) {
      console.error('Error logging out:', error);
    }
  };

  return (
    <div className={topClass}>
      <Container fluid={fluid}>
        <Row>
          <Col lg="6">
            <div className="header-contact">
              <ul>
                <li>Welcome UIT - SHOP</li>
              </ul>
            </div>
          </Col>
          <Col lg="6" className="text-end">
            <ul className="header-dropdown">
              <li className="mobile-wishlist">
                <Link href="/account/wishlist">
                  <i className="fa fa-heart" aria-hidden="true"></i> Yêu thích
                </Link>
              </li>
              <li className="onhover-dropdown mobile-account">
                <i className="fa fa-user" aria-hidden="true"></i> Tài khoản
                <ul className="onhover-show-div">
                  {sessionToken ? (
                    <>
                      <li>
                        <Link href={`/account/dashboard`}>Tài khoản</Link>
                      </li>
                      <li onClick={Logout}>
                        <a>Đăng xuất</a>
                      </li>
                    </>
                  ) : (
                    <>
                      <li>
                        <Link href={`/account/login`}>Đăng nhập</Link>
                      </li>
                      <li>
                        <Link href={`/account/register`}>Đăng ký</Link>
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
