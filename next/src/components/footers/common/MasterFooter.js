'use client'

import React, { useEffect, useState } from "react";
import Link from "next/link";
import {
  Container,
  Row,
  Col,
  Form,
  FormGroup,
  Input,
  Button,
  Collapse,
} from "reactstrap";
import LogoImage from "../../headers/common/logo";
import CopyRight from "./copyright";

const MasterFooter = ({
  containerFluid,
  logoName,
  layoutClass,
  footerClass,
  footerLayOut,
  footerSection,
  belowSection,
  belowContainerFluid,
  CopyRightFluid,
  newLatter,
}) => {
  const [isOpen, setIsOpen] = useState();
  const [collapse, setCollapse] = useState(0);
  const width = window.innerWidth <= 767;
  useEffect(() => {
    const changeCollapse = () => {
      if (window.innerWidth <= 767) {
        setCollapse(0);
        setIsOpen(false);
      } else setIsOpen(true);
    };

    window.addEventListener("resize", changeCollapse);

    return () => {
      window.removeEventListener("resize", changeCollapse);
    };
  }, []);
  return (
    <div>
      <footer className={footerClass}>
        <section className={belowSection}>
          <Container fluid={belowContainerFluid ? belowContainerFluid : ""}>
            <Row className="footer-theme partition-f">
              <Col lg="4" md="6">
                <div
                  className={`footer-title ${isOpen && collapse == 1 ? "active" : ""
                    } footer-mobile-title`}>
                  <h4
                    onClick={() => {
                      setCollapse(1);
                      setIsOpen(!isOpen);
                    }}>
                    about
                    <span className="according-menu"></span>
                  </h4>
                </div>
                <Collapse
                  isOpen={width ? (collapse === 1 ? isOpen : false) : true}>
                  <div className="footer-contant">
                    <div className="footer-logo">
                      <LogoImage logo={logoName} />
                    </div>
                    <p>
                      UIT - shop là website bán hàng tạo ra để sinh viên qua môn java
                    </p>
                    <div className="footer-social">
                      <ul>
                        <li>
                          <a href="https://www.facebook.com" target="_blank">
                            <i
                              className="fa fa-facebook"
                              aria-hidden="true"></i>
                          </a>
                        </li>
                        <li>
                          <a href="https://plus.google.com" target="_blank">
                            <i
                              className="fa fa-google-plus"
                              aria-hidden="true"></i>
                          </a>
                        </li>
                        <li>
                          <a href="https://twitter.com" target="_blank">
                            <i className="fa fa-twitter" aria-hidden="true"></i>
                          </a>
                        </li>
                        <li>
                          <a href="https://www.instagram.com" target="_blank">
                            <i
                              className="fa fa-instagram"
                              aria-hidden="true"></i>
                          </a>
                        </li>
                        <li>
                          <a href="https://rss.com" target="_blank">
                            <i className="fa fa-rss" aria-hidden="true"></i>
                          </a>
                        </li>
                      </ul>
                    </div>
                  </div>
                </Collapse>
              </Col>
              <Col className="offset-xl-1">
                <div className="sub-title">
                  <div
                    className={`footer-title ${isOpen && collapse == 2 ? "active" : ""
                      } `}>
                    <h4
                      onClick={() => {
                        if (width) {
                          setIsOpen(!isOpen);
                          setCollapse(2);
                        } else setIsOpen(true);
                      }}>
                      UIT-CLUB
                      <span className="according-menu"></span>
                    </h4>
                  </div>
                  <Collapse
                    isOpen={width ? (collapse === 2 ? isOpen : false) : true}>
                    <div className="footer-contant">
                      <ul>
                        <li>
                          <Link href={`/shop/left_sidebar`}>
                            {/* <a> */}
                            Đăng ký thành viên
                            {/* </a> */}
                          </Link>
                        </li>
                        <li>
                          <Link href={`/shop/left_sidebar`}>
                            {/* <a>  */}
                            Ưu đãi & đặc quyền
                            {/* </a> */}
                          </Link>
                        </li>
                      </ul>
                    </div>
                  </Collapse>
                </div>
              </Col>
              <Col>
                <div className="sub-title">
                  <div
                    className={`footer-title ${isOpen && collapse == 3 ? "active" : ""
                      } `}>
                    <h4
                      onClick={() => {
                        if (width) {
                          setIsOpen(!isOpen);
                          setCollapse(3);
                        } else setIsOpen(true);
                      }}>
                      Chăm sóc khách hàng
                      <span className="according-menu"></span>
                    </h4>
                  </div>
                  <Collapse
                    isOpen={width ? (collapse === 3 ? isOpen : false) : true}>
                    <div className="footer-contant">
                      <ul>
                        <li>
                          <a href="#">Chính sách đổi trả</a>
                        </li>
                        <li>
                          <a href="#">Chính sachs khuyến mại</a>
                        </li>
                        <li>
                          <a href="#">Chính sách bảo mật</a>
                        </li>
                        <li>
                          <a href="#">Chính sách giao hàng</a>
                        </li>
                        
                      </ul>
                    </div>
                  </Collapse>
                </div>
              </Col>
              <Col>
                <div className="sub-title">
                  <div
                    className={`footer-title ${isOpen && collapse == 4 ? "active" : ""
                      } `}>
                    <h4
                      onClick={() => {
                        if (width) {
                          setIsOpen(!isOpen);
                          setCollapse(4);
                        } else setIsOpen(true);
                      }}>
                      Địa chỉ liên hệ
                      <span className="according-menu"></span>
                    </h4>
                  </div>
                  <Collapse
                    isOpen={width ? (collapse === 4 ? isOpen : false) : true}>
                    <div className="footer-contant">
                      <ul className="contact-list">
                        <li>
                          <i className="fa fa-map-marker"></i>Tòa E, Đại học công nghệ thông tin, Đại học quốc gia tp.Hồ Chí Minh
                        </li>
                        <li>
                          <i className="fa fa-phone"></i>Điện thoại: 01281293123
                        </li>
                        <li>
                          <i className="fa fa-envelope-o"></i>Email:{" "}
                          <a href="#">Support@uitstore.com</a>
                        </li>
                       
                      </ul>
                    </div>
                  </Collapse>
                </div>
              </Col>
            </Row>
          </Container>
        </section>



        {/* <CopyRight
          layout={layoutClass}
          fluid={CopyRightFluid ? CopyRightFluid : ""}
        /> */}
      </footer>
    </div>
  );
};
export default MasterFooter;
