import React, { Fragment } from "react";
import Slider from "react-slick";
import MasterBanner from "./MasterBanner";

const Data = [
  {
    img: "home1",
    title: "welcome to fashion",
    desc: "men fashion",
    link: "/shop/left_sidebar",
  },
  {
    img: "home2",
    title: "welcome to fashion",
    desc: "women fashion",
    link: "/shop/left_sidebar",
  },
];

const Banner = () => {
  return (
    <Fragment>
      <section className="p-0">
        <Slider className="slide-1 home-slider">
          {Data.map((data, i) => {
            return (
              <MasterBanner
                key={i}
                img={data.img}
                desc={data.desc}
                title={data.title}
                link={data.link}
              />
            );
          })}
        </Slider>
      </section>
    </Fragment>
  );
};

export default Banner;
