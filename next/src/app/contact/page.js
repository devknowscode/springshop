"use client";

import React from "react";
import CommonLayout from "../../components/shop/common-layout";
import { Container, Row, Col, Form, Label, Input } from "reactstrap";
import './contact.css';

const Data = [
  {
    img: "fa-phone",
    title: "Liên hệ",
    desc1: "+84 987 439 012",
    desc2: "+84 987 439 012",
  },
  {
    img: "fa-map-marker",
    title: "Địa chỉ",
    desc1: "Tòa E, Đại học công nghệ thông tin, Đại học quốc gia TP.HCM",
    desc2: "Thành phố Hồ Chí Minh",
  },
  {
    img: "fa-envelope-o",
    title: "Email",
    desc1: "Support@uitstore.com",
    desc2: "Support@uitshop.com",
  },
  {
    img: "fa-fax",
    title: "fax",
    desc1: "Support@uitstore.com",
    desc2: "Support@uitshop.com",
  },
];

const ContactDetail = ({ img, title, desc1, desc2 }) => {
  return (
    <li>
      <div className="contact-icon">
        <i className={`fa ${img}`} aria-hidden="true"></i>
        <h6>{title}</h6>
      </div>
      <div className="media-body">
        <p>{desc1}</p>
        <p>{desc2}</p>
      </div>
    </li>
  );
};

const Contact = () => {
  return (
    <CommonLayout parent="home" title="Contact">
      <section className="contact-page section-b-space">
        <Container>
          <Row className="section-b-space">
            <Col lg="7" className="map">
              <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.231240416692!2d106.8004791748063!3d10.870008889284492!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317527587e9ad5bf%3A0xafa66f9c8be3c91!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBDw7RuZyBuZ2jhu4cgVGjDtG5nIHRpbiAtIMSQSFFHIFRQLkhDTQ!5e0!3m2!1svi!2s!4v1718035272476!5m2!1svi!2s"
                width="600"
                height="450"
                style={{ border: 0 }}
                allowFullScreen
                loading="lazy"
                referrerPolicy="no-referrer-when-downgrade"
              ></iframe>
            </Col>
            <Col lg="5">
              <div className="contact-right">
                <ul>
                  {Data.map((data, i) => (
                    <ContactDetail
                      key={i}
                      img={data.img}
                      title={data.title}
                      desc1={data.desc1}
                      desc2={data.desc2}
                    />
                  ))}
                </ul>
              </div>
            </Col>
          </Row>
          <Row>
            <Col sm="12">
              <Form className="theme-form">
                <Row>
                  <Col md="6">
                    <Label className="form-label" for="name">First Name</Label>
                    <Input
                      type="text"
                      className="form-control"
                      id="name"
                      placeholder="Enter Your name"
                      required
                    />
                  </Col>
                  <Col md="6">
                    <Label className="form-label" for="last-name">Last Name</Label>
                    <Input
                      type="text"
                      className="form-control"
                      id="last-name"
                      placeholder="Enter Your last name"
                      required
                    />
                  </Col>
                  <Col md="6">
                    <Label className="form-label" for="phone">Phone number</Label>
                    <Input
                      type="text"
                      className="form-control"
                      id="phone"
                      placeholder="Enter your phone number"
                      required
                    />
                  </Col>
                  <Col md="6">
                    <Label className="form-label" for="email">Email</Label>
                    <Input
                      type="email"
                      className="form-control"
                      id="email"
                      placeholder="Enter your email"
                      required
                    />
                  </Col>
                  <Col md="12">
                    <Label className="form-label" for="message">Write Your Message</Label>
                    <textarea
                      className="form-control"
                      placeholder="Write Your Message"
                      id="message"
                      rows="6"
                      required
                    ></textarea>
                  </Col>
                  <Col md="12">
                    <button className="btn btn-solid" type="submit">
                      Send Your Message
                    </button>
                  </Col>
                </Row>
              </Form>
            </Col>
          </Row>
        </Container>
      </section>
    </CommonLayout>
  );
};

export default Contact;
