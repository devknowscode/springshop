import React, { useState, useContext, useEffect } from "react";
import { Col, Row, Media, Button, Spinner } from "reactstrap";
import FilterContext from "../../../helpers/filter/FilterContext";
import ProductItem from "../../../components/common/product-box/ProductBox1";
import { CurrencyContext } from "../../../helpers/Currency/CurrencyContext";
import { useRouter } from "next/navigation";
import PostLoader from "../../../components/common/PostLoader";
import CartContext from "../../../helpers/cart";
import { WishlistContext } from "../../../helpers/wishlist/WishlistContext";
import axios from "axios";
import Pagination from "@mui/material/Pagination";

// const GET_PRODUCTS = gql`
//   query products(
//     $type: _CategoryType!
//     $indexFrom: Int!
//     $limit: Int!
//     $color: String!
//     $brand: [String!]!
//     $sortBy: _SortBy!
//     $priceMax: Int!
//     $priceMin: Int!
//   ) {
//     products(
//       type: $type
//       indexFrom: $indexFrom
//       limit: $limit
//       color: $color
//       brand: $brand
//       sortBy: $sortBy
//       priceMax: $priceMax
//       priceMin: $priceMin
//     ) {
//       total
//       hasMore
//       items {
//         id
//         title
//         description
//         type
//         brand
//         category
//         price
//         new
//         sale
//         stock
//         discount
//         variants {
//           id
//           sku
//           size
//           color
//           image_id
//         }
//         images {
//           image_id
//           id
//           alt
//           src
//         }
//       }
//     }
//   }
// `;

const ProductList = ({ colClass, layoutList, openSidebar, noSidebar }) => {
  const cartContext = useContext(CartContext);
  const quantity = cartContext.quantity;
  const wishlistContext = useContext(WishlistContext);
  const router = useRouter();
  const [limit, setLimit] = useState(8);
  const curContext = useContext(CurrencyContext);
  const [grid, setGrid] = useState(colClass);
  const symbol = curContext.state.symbol;
  const filterContext = useContext(FilterContext);
  const selectedBrands = filterContext.selectedBrands;
  const selectedColor = filterContext.selectedColor;
  const selectedPrice = filterContext.selectedPrice;
  const selectedCategory = filterContext.state;
  const selectedSize = filterContext.selectedSize;
  const [sortBy, setSortBy] = useState("AscOrder");
  const [isLoading, setIsLoading] = useState(false);
  const [layout, setLayout] = useState(layoutList);
  const [url, setUrl] = useState();
  // const [data, setData] = useState([]);
  const data = {
    "products": {
      "items": [
        {
          "id": 1,
          "title": "trim dress",
          "description": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.",
          "type": "fashion",
          "brand": "nike",
          "category": "Women",
          "price": "145",
          "new": "true",
          "stock": 5,
          "sale": "true",
          "discount": "40",
          "variants": [
            {
              "id": "1.1",
              "sku": "sku1",
              "size": "s",
              "color": "yellow",
              "image_id": 111
            },
            {
              "id": "1.2",
              "sku": "sku2",
              "size": "s",
              "color": "white",
              "image_id": 112
            },
            {
              "id": "1.3",
              "sku": "sku3",
              "size": "s",
              "color": "pink",
              "image_id": 113
            },
            {
              "id": "1.4",
              "sku": "sku4",
              "size": "m",
              "color": "yellow",
              "image_id": 111
            },
            {
              "id": "1.5",
              "sku": "sku5",
              "size": "m",
              "color": "white",
              "image_id": 112
            },
            {
              "id": "1.6",
              "sku": "sku5",
              "size": "m",
              "color": "pink",
              "image_id": 113
            },
            {
              "id": "1.7",
              "sku": "sku1",
              "size": "l",
              "color": "yellow",
              "image_id": 111
            }
          ],
          "images": [
            {
              "image_id": 111,
              "id": "1.1",
              "alt": "yellow",
              "src": "/assets/images/pro3/39.jpg"
            },
            {
              "image_id": 112,
              "id": "1.2",
              "alt": "white",
              "src": "/assets/images/pro3/6.jpg"
            },
            {
              "image_id": 113,
              "id": "1.3",
              "alt": "pink",
              "src": "/assets/images/pro3/25.jpg"
            }
          ]
        },
        {
          "id": 2,
          "title": "belted dress",
          "description": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.",
          "type": "fashion",
          "brand": "zara",
          "category": "Women",
          "price": "185",
          "new": "false",
          "stock": 2,
          "sale": "false",
          "discount": "40",
          "variants": [
            {
              "id": "2.1",
              "sku": "sku1",
              "size": "s",
              "color": "olive",
              "image_id": 211
            },
            {
              "id": "2.2",
              "sku": "sku2",
              "size": "s",
              "color": "navy",
              "image_id": 212
            },
            {
              "id": "2.3",
              "sku": "sku3",
              "size": "s",
              "color": "red",
              "image_id": 213
            },
            {
              "id": "2.4",
              "sku": "sku4",
              "size": "m",
              "color": "olive",
              "image_id": 211
            },
            {
              "id": "2.5",
              "sku": "sku4",
              "size": "m",
              "color": "navy",
              "image_id": 212
            },
            {
              "id": "2.6",
              "sku": "sku4",
              "size": "m",
              "color": "red",
              "image_id": 213
            },
            {
              "id": "2.7",
              "sku": "sku4",
              "size": "l",
              "color": "olive",
              "image_id": 211
            },
            {
              "id": "2.8",
              "sku": "sku4",
              "size": "l",
              "color": "navy",
              "image_id": 212
            },
            {
              "id": "2.9",
              "sku": "sku4",
              "size": "l",
              "color": "red",
              "image_id": 213
            }
          ],
          "images": [
            {
              "image_id": 211,
              "id": "2.1",
              "alt": "olive",
              "src": "/assets/images/pro3/3.jpg"
            },
            {
              "image_id": 212,
              "id": "2.2",
              "alt": "navy",
              "src": "/assets/images/pro3/4.jpg"
            },
            {
              "image_id": 213,
              "id": "2.3",
              "alt": "pink",
              "src": "/assets/images/pro3/5.jpg"
            },
            {
              "image_id": 214,
              "id": "2.4",
              "alt": "pink",
              "src": "/assets/images/pro3/15.jpg"
            }
          ]
        },
        {
          "id": 3,
          "title": "fitted dress",
          "description": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.",
          "type": "fashion",
          "brand": "denim",
          "category": "Women",
          "price": "174",
          "new": "false",
          "stock": 0,
          "sale": "false",
          "discount": "40",
          "variants": [
            {
              "id": "3.1",
              "sku": "sku3",
              "size": "l",
              "color": "white",
              "image_id": 311
            },
            {
              "id": "3.2",
              "sku": "skul3",
              "size": "m",
              "color": "white",
              "image_id": 311
            },
            {
              "id": "3.3",
              "sku": "sku3l",
              "size": "l",
              "color": "black",
              "image_id": 312
            },
            {
              "id": "3.4",
              "sku": "sku4m",
              "size": "m",
              "color": "black",
              "image_id": 312
            }
          ],
          "images": [
            {
              "image_id": 311,
              "id": "3.1",
              "alt": "white",
              "src": "/assets/images/pro3/1.jpg"
            },
            {
              "image_id": 312,
              "id": "3.2",
              "alt": "white",
              "src": "/assets/images/pro3/2.jpg"
            }
          ]
        },
        {
          "id": 4,
          "title": "belted top",
          "description": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.",
          "type": "fashion",
          "brand": "madame",
          "category": "Women",
          "price": "98",
          "new": "true",
          "stock": 10,
          "sale": "false",
          "discount": "50",
          "variants": [
            {
              "id": "4.1",
              "sku": "sku4",
              "size": "s",
              "color": "white",
              "image_id": 411
            },
            {
              "id": "4.2",
              "sku": "skul4",
              "size": "l",
              "color": "white",
              "image_id": 411
            },
            {
              "id": "4.3",
              "sku": "sku4s",
              "size": "s",
              "color": "skyblue",
              "image_id": 412
            },
            {
              "id": "4.4",
              "sku": "sku4l",
              "size": "l",
              "color": "skyblue",
              "image_id": 412
            }
          ],
          "images": [
            {
              "image_id": 411,
              "id": "4.1",
              "alt": "white",
              "src": "/assets/images/pro3/8.jpg"
            },
            {
              "image_id": 412,
              "id": "4.2",
              "alt": "skyblue",
              "src": "/assets/images/pro3/7.jpg"
            }
          ]
        },
        {
          "id": 5,
          "title": "waist dress",
          "description": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.",
          "type": "fashion",
          "brand": "biba",
          "category": "Women",
          "price": "230",
          "new": "true",
          "stock": 4,
          "sale": "true",
          "discount": "20",
          "variants": [
            {
              "id": "5.1",
              "sku": "sku5",
              "size": "m",
              "color": "green",
              "image_id": 511
            },
            {
              "id": "5.2",
              "sku": "skul5",
              "size": "l",
              "color": "green",
              "image_id": 511
            },
            {
              "id": "5.3",
              "sku": "sku5s",
              "size": "m",
              "color": "black",
              "image_id": 512
            },
            {
              "id": "5.4",
              "sku": "sku5l",
              "size": "l",
              "color": "black",
              "image_id": 512
            }
          ],
          "images": [
            {
              "image_id": 511,
              "id": "5.1",
              "alt": "green",
              "src": "/assets/images/pro3/9.jpg"
            },
            {
              "image_id": 512,
              "id": "5.2",
              "alt": "black",
              "src": "/assets/images/pro3/10.jpg"
            }
          ]
        },
        {
          "id": 6,
          "title": "crop top",
          "description": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.",
          "type": "fashion",
          "brand": "max",
          "category": "Women",
          "price": "121",
          "new": "true",
          "stock": 30,
          "sale": "false",
          "discount": "40",
          "variants": [
            {
              "id": "6.1",
              "sku": "sku6",
              "size": "s",
              "color": "olive",
              "image_id": 611
            },
            {
              "id": "6.2",
              "sku": "skul6",
              "size": "s",
              "color": "gray",
              "image_id": 612
            },
            {
              "id": "6.3",
              "sku": "sku6s",
              "size": "s",
              "color": "red",
              "image_id": 613
            },
            {
              "id": "6.4",
              "sku": "sku6l",
              "size": "m",
              "color": "olive",
              "image_id": 611
            },
            {
              "id": "6.5",
              "sku": "sku6l",
              "size": "m",
              "color": "gray",
              "image_id": 612
            },
            {
              "id": "6.6",
              "sku": "sku6l",
              "size": "m",
              "color": "red",
              "image_id": 613
            }
          ],
          "images": [
            {
              "image_id": 611,
              "id": "6.1",
              "alt": "olive",
              "src": "/assets/images/pro3/11.jpg"
            },
            {
              "image_id": 612,
              "id": "6.2",
              "alt": "gray",
              "src": "/assets/images/pro3/12.jpg"
            },
            {
              "image_id": 613,
              "id": "6.3",
              "alt": "red",
              "src": "/assets/images/pro3/22.jpg"
            }
          ]
        },
        {
          "id": 7,
          "title": "sleeveless dress",
          "description": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.",
          "type": "fashion",
          "brand": "biba",
          "category": "Women",
          "price": "290",
          "new": "true",
          "stock": 15,
          "sale": "true",
          "discount": "10",
          "variants": [
            {
              "id": "7.1",
              "sku": "sku7",
              "size": "s",
              "color": "pink",
              "image_id": 711
            },
            {
              "id": "7.2",
              "sku": "skul7",
              "size": "s",
              "color": "white",
              "image_id": 712
            },
            {
              "id": "7.3",
              "sku": "sku7s",
              "size": "s",
              "color": "black",
              "image_id": 713
            },
            {
              "id": "7.4",
              "sku": "sku7l",
              "size": "m",
              "color": "pink",
              "image_id": 711
            },
            {
              "id": "7.5",
              "sku": "sku7l",
              "size": "m",
              "color": "white",
              "image_id": 712
            },
            {
              "id": "7.6",
              "sku": "sku7l",
              "size": "m",
              "color": "black",
              "image_id": 713
            }
          ],
          "images": [
            {
              "image_id": 711,
              "id": "7.1",
              "alt": "pink",
              "src": "/assets/images/pro3/13.jpg"
            },
            {
              "image_id": 712,
              "id": "7.2",
              "alt": "white",
              "src": "/assets/images/pro3/8.jpg"
            },
            {
              "image_id": 713,
              "id": "7.3",
              "alt": "black",
              "src": "/assets/images/pro3/15.jpg"
            }
          ]
        },
        {
          "id": 8,
          "title": "v-neck dress",
          "description": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.",
          "type": "fashion",
          "brand": "zara",
          "category": "Women",
          "price": "315",
          "new": "false",
          "stock": 15,
          "sale": "true",
          "discount": "70",
          "variants": [
            {
              "id": "8.1",
              "sku": "sku8",
              "size": "s",
              "color": "yellow",
              "image_id": 811
            },
            {
              "id": "8.2",
              "sku": "skul8",
              "size": "s",
              "color": "black",
              "image_id": 812
            },
            {
              "id": "8.3",
              "sku": "sku8s",
              "size": "m",
              "color": "yellow",
              "image_id": 811
            },
            {
              "id": "8.4",
              "sku": "sku8l",
              "size": "m",
              "color": "black",
              "image_id": 812
            }
          ],
          "images": [
            {
              "image_id": 811,
              "id": "8.1",
              "alt": "yellow",
              "src": "/assets/images/pro3/14.jpg"
            },
            {
              "image_id": 812,
              "id": "8.2",
              "alt": "black",
              "src": "/assets/images/pro3/16.jpg"
            }
          ]
        }
      ]
    }
  }

  useEffect(() => {
    const pathname = window.location.pathname;
    setUrl(pathname);
    router.push(
      `${pathname}?${filterContext.state}&brand=${selectedBrands}&color=${selectedColor}&size=${selectedSize}&minPrice=${selectedPrice.min}&maxPrice=${selectedPrice.max}`,
      undefined,
      { shallow: true }
    );
  }, [selectedBrands, selectedColor, selectedSize, selectedPrice]);

  // useEffect(() => {
  //   axios
  //   .get(`http://localhost:8088/v1/api/products?page=0&limit=8`)
  //   .then(({ data }) => {
  //       setData(data.metadata);
  //       console.log("isLoading::", isLoading)
  //       console.log("response::", data)
  //     })
  //     .catch((e) => {
  //       console.log(e);
  //     });
  // }, []);

  const handlePagination = (e, p) => {
    setIsLoading(true);
    setTimeout(() => {
      axios
        .get(`http://localhost:8088/v1/api/products?page=${0}&limit=${8}`)
        .then(({ data }) => {
          setIsLoading(false);
          console.log(data);
        })
        .catch((e) => {
          console.log(e);
        });
    }, 1000);
  };

  const removeBrand = (val) => {
    const temp = [...selectedBrands];
    temp.splice(selectedBrands.indexOf(val), 1);
    filterContext.setSelectedBrands(temp);
  };

  const removeSize = (val) => {
    const temp = [...selectedSize];
    temp.splice(selectedSize.indexOf(val), 1);
    filterContext.setSelectedSize(temp);
  };

  const removeColor = () => {
    filterContext.setSelectedColor("");
  };

  return (
    <Col className="collection-content">
      <div className="page-main-content">
        <Row>
          <Col sm="12">
            <Row>
              <Col xs="12">
                <ul className="product-filter-tags">
                  {selectedBrands.map((brand, i) => (
                    <li key={i}>
                      <a href={null} className="filter_tag">
                        {brand}
                        <i
                          className="fa fa-close"
                          onClick={() => removeBrand(brand)}
                        ></i>
                      </a>
                    </li>
                  ))}
                  {selectedColor ? (
                    <li>
                      <a href={null} className="filter_tag">
                        {selectedColor}
                        <i className="fa fa-close" onClick={removeColor}></i>
                      </a>
                    </li>
                  ) : (
                    ""
                  )}
                  {selectedSize.map((size, i) => (
                    <li key={i}>
                      <a href={null} className="filter_tag">
                        {size}
                        <i
                          className="fa fa-close"
                          onClick={() => removeSize(size)}
                        ></i>
                      </a>
                    </li>
                  ))}
                  {
                    <li>
                      <a href={null} className="filter_tag">
                        price: {selectedPrice.min}- {selectedPrice.max}
                      </a>
                    </li>
                  }
                </ul>
              </Col>
            </Row>
            <div className="collection-product-wrapper">
              <div className="product-top-filter">
                {!noSidebar ? (
                  <Row>
                    <Col xl="12">
                      <div
                        className="filter-main-btn"
                        onClick={() => openSidebar()}
                      >
                        <span className="filter-btn btn btn-theme">
                          <i className="fa fa-filter" aria-hidden="true"></i>
                          Filter
                        </span>
                      </div>
                    </Col>
                  </Row>
                ) : (
                  ""
                )}
                <Row>
                  <Col>
                    <div className="product-filter-content">
                      <div className="search-count">
                        <h5>
                          {data.products
                            ? `Showing Products 1-${data.products.items.length} of ${data.products.items.length}`
                            : "loading"}
                          Result
                        </h5>
                      </div>
                      <div className="collection-view">
                        <ul>
                          <li>
                            <i
                              className="fa fa-th grid-layout-view"
                              onClick={() => {
                                setLayout("");
                                setGrid("col-lg-3");
                              }}
                            ></i>
                          </li>
                          <li>
                            <i
                              className="fa fa-list-ul list-layout-view"
                              onClick={() => {
                                setLayout("list-view");
                                setGrid("col-lg-12");
                              }}
                            ></i>
                          </li>
                        </ul>
                      </div>
                      <div
                        className="collection-grid-view"
                        style={
                          layout === "list-view"
                            ? { visibility: "hidden" }
                            : { visibility: "visible" }
                        }
                      >
                        <ul>
                          <li>
                            <Media
                              src={`/assets/images/icon/2.png`}
                              alt=""
                              className="product-2-layout-view"
                              onClick={() => setGrid("col-lg-6")}
                            />
                          </li>
                          <li>
                            <Media
                              src={`/assets/images/icon/3.png`}
                              alt=""
                              className="product-3-layout-view"
                              onClick={() => setGrid("col-lg-4")}
                            />
                          </li>
                          <li>
                            <Media
                              src={`/assets/images/icon/4.png`}
                              alt=""
                              className="product-4-layout-view"
                              onClick={() => setGrid("col-lg-3")}
                            />
                          </li>
                          <li>
                            <Media
                              src={`/assets/images/icon/6.png`}
                              alt=""
                              className="product-6-layout-view"
                              onClick={() => setGrid("col-lg-2")}
                            />
                          </li>
                        </ul>
                      </div>
                      <div className="product-page-per-view">
                        <select
                          onChange={(e) => setLimit(parseInt(e.target.value))}
                        >
                          <option value="10">10 Products Per Page</option>
                          <option value="15">15 Products Per Page</option>
                          <option value="20">20 Products Per Page</option>
                        </select>
                      </div>
                      <div className="product-page-filter">
                        <select onChange={(e) => setSortBy(e.target.value)}>
                          <option value="AscOrder">Sorting items</option>
                          <option value="HighToLow">High To Low</option>
                          <option value="LowToHigh">Low To High</option>
                          <option value="Newest">Newest</option>
                          <option value="AscOrder">Asc Order</option>
                          <option value="DescOrder">Desc Order</option>
                        </select>
                      </div>
                    </div>
                  </Col>
                </Row>
              </div>
              <div className={`product-wrapper-grid ${layout}`}>
                <Row>
                  {/* Product Box */}
                  {!data ||
                  !data.products ||
                  data.products.length === 0 ||
                  isLoading ? (
                    data && data.products && data.products.length === 0 ? (
                      <Col xs="12">
                        <div>
                          <div className="col-sm-12 empty-cart-cls text-center">
                            <img
                              src={`/assets/images/empty-search.jpg`}
                              className="img-fluid mb-4 mx-auto"
                              alt=""
                            />
                            <h3>
                              <strong>Your Cart is Empty</strong>
                            </h3>
                            <h4>Explore more shortlist some items.</h4>
                          </div>
                        </div>
                      </Col>
                    ) : (
                      <div className="row mx-0 margin-default mt-4">
                        <div className="col-xl-3 col-lg-4 col-6">
                          <PostLoader />
                        </div>
                        <div className="col-xl-3 col-lg-4 col-6">
                          <PostLoader />
                        </div>
                        <div className="col-xl-3 col-lg-4 col-6">
                          <PostLoader />
                        </div>
                        <div className="col-xl-3 col-lg-4 col-6">
                          <PostLoader />
                        </div>
                      </div>
                    )
                  ) : (
                    data &&
                    data.products.items.map((product, i) => (
                      <div className={grid} key={i}>
                        <div className="product">
                          <div>
                            <ProductItem
                              des={true}
                              product={product}
                              symbol={symbol}
                              cartClass="cart-info cart-wrap"
                              addWishlist={() =>
                                wishlistContext.addToWish(product)
                              }
                              addCart={() =>
                                cartContext.addToCart(product, quantity)
                              }
                            />
                          </div>
                        </div>
                      </div>
                    ))
                  )}
                </Row>
              </div>
              <div className="section-t-space">
                <div className="center">
                  <Pagination
                    count={3}
                    variant="outlined"
                    shape="rounded"
                    onChange={handlePagination}
                  />
                </div>
              </div>
            </div>
          </Col>
        </Row>
      </div>
    </Col>
  );
};

export default ProductList;
