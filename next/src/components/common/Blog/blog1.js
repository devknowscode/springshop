import React, { Fragment } from "react";
import Slider from "react-slick";
import Link from "next/link";
import { Slider3 } from "../../../services/script";
import { Media, Container, Row, Col } from "reactstrap";

const BlogSection = ({ type, sectionClass, title, inner, hrClass }) => {
  const data = {
    "blog": [
      {
        "img": "/assets/images/blog/1.jpg",
        "link": "/blog/details",
        "title": "25 January 2018",
        "desc": "Lorem ipsum dolor sit consectetur adipiscing elit",
        "date": "by: John Dio , 2 Comment"
      },
      {
        "img": "/assets/images/blog/2.jpg",
        "link": "/blog/details",
        "title": "26 January 2018",
        "desc": "Lorem ipsum dolor sit consectetur adipiscing elit",
        "date": "by: John Dio , 2 Comment"
      },
      {
        "img": "/assets/images/blog/3.jpg",
        "link": "/blog/details",
        "title": "29 January 2018",
        "desc": "Lorem ipsum dolor sit consectetur adipiscing elit",
        "date": "by: John Dio , 2 Comment"
      },
      {
        "img": "/assets/images/blog/4.jpg",
        "link": "/blog/details",
        "title": "29 January 2018",
        "desc": "Lorem ipsum dolor sit consectetur adipiscing elit",
        "date": "by: John Dio , 2 Comment"
      },
      {
        "img": "/assets/images/blog/5.jpg",
        "link": "/blog/details",
        "title": "29 January 2018",
        "desc": "Lorem ipsum dolor sit consectetur adipiscing elit",
        "date": "by: John Dio , 2 Comment"
      },
      {
        "img": "/assets/images/blog/6.jpg",
        "link": "/blog/details",
        "title": "29 January 2018",
        "desc": "Lorem ipsum dolor sit consectetur adipiscing elit",
        "date": "by: John Dio , 2 Comment"
      }
    ]
  }
  return (
    <Fragment>
      <section className={sectionClass}>
        <Container>
          <Row>
            <Col md="12">
              <div className={title}>
                {/* <h4>our collection</h4> */}
                <h2 className={inner}>blogs</h2>
                {hrClass ? (
                  <hr role="tournament6"></hr>
                ) : (
                  <div className="line">
                    <span></span>
                  </div>
                )}
              </div>
              <Slider {...Slider3} className="slide-3 no-arrow slick-default-margin">
                {data &&
                  data.blog.map((item, index) => (
                    <Col md="12" key={index}>
                      <Link href={`/blogs/blog_detail`}>
                        <div className="classic-effect">
                          <Media src={item.img} className="img-fluid" alt="" />
                          <span></span>
                        </div>
                      </Link>
                      <div className="blog-details">
                        <h4>{item.title}</h4>
                        <Link href={`/blogs/blog_detail`}>
                          <p>{item.desc} </p>
                        </Link>
                        <hr className="style1" />
                        <h6>by: {item.date}</h6>
                      </div>
                    </Col>
                  ))}
              </Slider>
            </Col>
          </Row>
        </Container>
      </section>
    </Fragment>
  );
};
export default BlogSection;
