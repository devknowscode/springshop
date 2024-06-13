"use client"

import React from "react";
import CommonLayout from "@/components/shop/common-layout";
import { Container, Row, Col, Media } from "reactstrap";
import aboutus from "/public/assets/images/about/about_us.jpg";
import Slider from "react-slick";
import { Slider2, Slider4 } from "@/services/script";
import ServiceLayout from "@/components/common/Service/service1.js";

const TeamData = [
  {
    img: "/assets/images/team/1.jpg",
    name: "Trung Lê Quang",
    post: "CEo & Founder At Company",
  },
  {
    img: "/assets/images/team/2.jpg",
    name: "Trung Nguyễn Minh",
    post: "CEo & Founder At Company",
  },
  {
    img: "/assets/images/team/3.jpg",
    name: "Phát Nguyễn Lý",
    post: "CEo & Founder At Company",
  },
  {
    img: "/assets/images/team/4.jpg",
    name: "Nhàn Nguyễn Thị",
    post: "CEo & Founder At Company",
  },
  {
    img: "/assets/images/team/1.jpg",
    name: "Trung Lê Quang",
    post: "CEo & Founder At Company",
  },
];

const Team = ({ img, name, post }) => {
  return (
    <div>
      <div>
        <Media src={img} className="img-fluid blur-up lazyload bg-img" alt="" />
      </div>
      <h4>{name}</h4>
      <h6>{post}</h6>
    </div>
  );
};

const TeamDetailData = [
  {
    img: "/assets/images/avtar.jpg",
    name: "mark jenco",
    post: "designer",
    about: "you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings.",
  },
  {
    img: "/assets/images/2.jpg",
    name: "mark jenco",
    post: "designer",
    about: "you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings.",
  },
  {
    img: "/assets/images/avtar.jpg",
    name: "mark jenco",
    post: "designer",
    about: "you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings.",
  },
  {
    img: "/assets/images/avtar.jpg",
    name: "mark jenco",
    post: "designer",
    about: "you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings.",
  },
  {
    img: "/assets/images/avtar.jpg",
    name: "mark jenco",
    post: "designer",
    about: "you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings.",
  },
  {
    img: "/assets/images/avtar.jpg",
    name: "mark jenco",
    post: "designer",
    about: "you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings.",
  },
];

const TeamDetail = ({ img, name, post, about }) => {
  return (
    <div>
      <div className="media">
        <div className="text-center">
          <Media src={img} alt="#" />
          <h5>{name}</h5>
          <h6>{post}</h6>
        </div>
        <div className="media-body">
          <p>{about}</p>
        </div>
      </div>
    </div>
  );
};
const AboutUs = () => {
  return (
    <>
      <CommonLayout parent="home" title="About-us">
        {/* // <!-- about section start --> */}
        <section className="about-page section-b-space">
          <Container>
            <Row>
              <Col lg="12">
                <div className="banner-section">
                  <Media src={aboutus.src} className="img-fluid blur-up lazyload" alt="" />
                </div>
              </Col>
              <Col sm="12">
                <h4>Hãy tự tin bước tiếp, nếu hôm nay bạn dừng lại thì hãy nhìn ra xa, chắc chắn mọi người cùng dừng lại giống bạn, đừng sợ nha!</h4>
                <p>Hãy tự tin bước tiếp, nếu hôm nay bạn dừng lại thì hãy nhìn ra xa, chắc chắn mọi người cùng dừng lại giống bạn, đừng sợ nha!</p>
                <p>
                  Mặt khác, chúng tôi lên án với sự phẫn nộ chính đáng và không thích những người đàn ông bị mê hoặc và mất tinh thần bởi sự quyến rũ của thú vui nhất thời, đến mức họ mù quáng vì ham muốn.
                  không thể thấy trước nỗi đau và rắc rối chắc chắn sẽ xảy ra sau đó; và sự đổ lỗi ngang nhau thuộc về những người thất bại trong nhiệm vụ của mình do ý chí yếu kém, điều này cũng giống như nói qua
                  co rúm lại vì vất vả và đau đớn. Những trường hợp này là hoàn toàn đơn giản và dễ dàng để phân biệt. Trong một giờ rảnh rỗi, khi quyền lựa chọn của chúng ta không bị cản trở và khi không có gì ngăn cản sự tồn tại của chúng ta
                  được làm điều mình thích nhất, mọi niềm vui đều được đón nhận và mọi nỗi đau đều tránh được. Nhưng trong một số trường hợp nhất định và do các yêu cầu về nghĩa vụ hoặc nghĩa vụ kinh doanh,
                  sẽ thường xuyên xảy ra việc niềm vui phải bị từ chối và sự khó chịu phải được chấp nhận. Do đó, người khôn ngoan luôn tuân theo nguyên tắc lựa chọn này trong những vấn đề này: anh ta bác bỏ
                  vui để đạt được những thú vui khác lớn hơn, nếu không thì anh ta chịu đựng nỗi đau để tránh những nỗi đau tồi tệ hơn.
                </p>
              </Col>
            </Row>
          </Container>
        </section>

        {/* <!--Testimonial start--> */}
        {/* <section className="testimonial small-section">
          <Container>
            <Row>
              <Col sm="12">
                <Slider {...Slider2} className="slide-2 testimonial-slider no-arrow">
                  {TeamDetailData.map((data, i) => {
                    return <TeamDetail key={i} img={data.img} name={data.name} post={data.post} about={data.about} />;
                  })}
                </Slider>
              </Col>
            </Row>
          </Container>
        </section> */}
        {/* <!--Testimonial ends--> */}

        {/* <!--Team start--> */}
        <section id="team" className="team section-b-space ratio_asos">
          <Container>
            <Row>
              <Col sm="12">
                <h2>Our Team</h2>
                <Slider className="team-4" {...Slider4}>
                  {TeamData.map((data, i) => {
                    return <Team key={i} img={data.img} name={data.name} post={data.post} />;
                  })}
                </Slider>
              </Col>
            </Row>
          </Container>
        </section>
        {/* <!--Team ends--> */}

        <div className="section-b-space">
          <ServiceLayout sectionClass={"service border-section small-section"} />
        </div>
      </CommonLayout>
    </>
  );
};

export default AboutUs;
