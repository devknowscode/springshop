import React from "react";

const BlogSidebar = () => {
  const popularBlogData = [
    {
      date: "03",
      month: "May",
      title: "Injected humour the like",
      hits: "0",
      blog: "it look like readable English. Many desktop publishing text.",
    },
    {
      date: "03",
      month: "May",
      title: "Injected humour the like",
      hits: "0",
      blog: "it look like readable English. Many desktop publishing text.",
    },
    {
      date: "03",
      month: "May",
      title: "Injected humour the like",
      hits: "0",
      blog: "it look like readable English. Many desktop publishing text.",
    },
    {
      date: "03",
      month: "May",
      title: "Injected humour the like",
      hits: "0",
      blog: "it look like readable English. Many desktop publishing text.",
    },
  ];

  const data = {
    "blog": [
      {
        "img": "/assets/images/blog/1.jpg",
        "link": "/blog/details",
        "title": "25 January 2018",
        "desc": "Lorem ipsum dolor sit consectetur adipiscing elit",
        "date": "by: John Dio , 2 Comment",
        "longDesc": "Consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.",
        "shortDesc": "you how all this mistaken idea of denouncing pleasure and praising pain was born"
      },
      {
        "img": "/assets/images/blog/2.jpg",
        "link": "/blog/details",
        "title": "26 January 2018",
        "desc": "Lorem ipsum dolor sit consectetur adipiscing elit",
        "date": "by: John Dio , 2 Comment",
        "longDesc": "Consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.",
        "shortDesc": "you how all this mistaken idea of denouncing pleasure and praising pain was born"
      },
      {
        "img": "/assets/images/blog/3.jpg",
        "link": "/blog/details",
        "title": "29 January 2018",
        "desc": "Lorem ipsum dolor sit consectetur adipiscing elit",
        "date": "by: John Dio , 2 Comment",
        "longDesc": "Consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.",
        "shortDesc": "you how all this mistaken idea of denouncing pleasure and praising pain was born"
      },
      {
        "img": "/assets/images/blog/4.jpg",
        "link": "/blog/details",
        "title": "29 January 2018",
        "desc": "Lorem ipsum dolor sit consectetur adipiscing elit",
        "date": "by: John Dio , 2 Comment",
        "longDesc": "Consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.",
        "shortDesc": "you how all this mistaken idea of denouncing pleasure and praising pain was born"
      },
      {
        "img": "/assets/images/blog/5.jpg",
        "link": "/blog/details",
        "title": "29 January 2018",
        "desc": "Lorem ipsum dolor sit consectetur adipiscing elit",
        "date": "by: John Dio , 2 Comment",
        "longDesc": "Consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.",
        "shortDesc": "you how all this mistaken idea of denouncing pleasure and praising pain was born"
      },
      {
        "img": "/assets/images/blog/6.jpg",
        "link": "/blog/details",
        "title": "29 January 2018",
        "desc": "Lorem ipsum dolor sit consectetur adipiscing elit",
        "date": "by: John Dio , 2 Comment",
        "longDesc": "Consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.",
        "shortDesc": "you how all this mistaken idea of denouncing pleasure and praising pain was born"
      }
    ]
  }

  return (
    <>
      <div className="col-xl-3 col-lg-4 col-md-5">
        <div className="blog-sidebar">
          <div className="theme-card">
            <h4>Recent Blog</h4>
            <ul className="recent-blog">
              {data &&
                data.blog.map((item, i) => (
                  <li key={i}>
                    <div className="media">
                      <img
                        className="img-fluid blur-up lazyload"
                        src={item.img}
                        alt="Generic placeholder image"
                      />
                      <div className="media-body align-self-center">
                        <h6>{item.title}</h6>
                        <p>0 hits</p>
                      </div>
                    </div>
                  </li>
                ))}
            </ul>
          </div>
          <div className="theme-card">
            <h4>Popular Blog</h4>
            <ul className="popular-blog">
              {popularBlogData.map((blogData, i) => {
                return (
                  <li key={i}>
                    <div className="media">
                      <div className="blog-date">
                        <span>{blogData.date} </span>
                        <span>{blogData.month}</span>
                      </div>
                      <div className="media-body align-self-center">
                        <h6>{blogData.title}</h6>
                        <p>{blogData.hits} hits</p>
                      </div>
                    </div>
                    <p>{blogData.blog}</p>
                  </li>
                );
              })}
            </ul>
          </div>
        </div>
      </div>
    </>
  );
};

export default BlogSidebar;
