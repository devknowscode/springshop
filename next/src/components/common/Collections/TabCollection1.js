import React, { useState, useContext } from "react";
import { Tab, Tabs, TabList, TabPanel } from "react-tabs";
import ProductItem from "../product-box/ProductBox1";
import CartContext from "../../../helpers/cart/index";
import { Container, Row, Col, Media } from "reactstrap";
import { WishlistContext } from "../../../helpers/wishlist/WishlistContext";
import PostLoader from "../PostLoader";
import { CurrencyContext } from "../../../helpers/Currency/CurrencyContext";
import emptySearch from "/public/assets/images/empty-search.jpg";

const TabContent = ({
  data,
  loading,
  startIndex,
  endIndex,
  cartClass,
  backImage,
}) => {
  const context = useContext(CartContext);
  const wishListContext = useContext(WishlistContext);
  const curContext = useContext(CurrencyContext);
  const currency = curContext.state;
  const quantity = context.quantity;

  return (
    <Row className="no-slider">
      {!data ||
      !data.products ||
      !data.products.items ||
      data.products.items.length === 0 ||
      loading ? (
        data &&
        data.products &&
        data.products.items &&
        data.products.items.length === 0 ? (
          <Col xs="12">
            <div>
              <div className="col-sm-12 empty-cart-cls text-center">
                <Media
                  src={emptySearch}
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
          <div className="row mx-0 margin-default">
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
        data.products.items
          .slice(startIndex, endIndex)
          .map((product, i) => (
            <ProductItem
              key={i}
              product={product}
              symbol={currency.symbol}
              addCart={() => context.addToCart(product, quantity)}
              addWishlist={() => wishListContext.addToWish(product)}
              cartClass={cartClass}
              backImage={backImage}
            />
          ))
      )}
    </Row>
  );
};

const SpecialProducts = ({
  type,
  fluid,
  designClass,
  cartClass,
  heading,
  noTitle,
  title,
  inner,
  line,
  hrClass,
  backImage,
}) => {
  const [activeTab, setActiveTab] = useState(type);
  const context = useContext(CartContext);
  const wishListContext = useContext(WishlistContext);
  const curContext = useContext(CurrencyContext);
  const currency = curContext.state;
  const quantity = context.quantity;
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
  const loading = false;

  return (
    <div>
      <section className={designClass}>
        <Container fluid={fluid}>
          {noTitle ? (
            ""
          ) : (
            <div className={title}>
              <h4>exclusive products</h4>
              <h2 className={inner}>special products</h2>
              {line ? (
                <div className="line"></div>
              ) : hrClass ? (
                <hr role="tournament6"></hr>
              ) : (
                ""
              )}
            </div>
          )}

          <Tabs className="theme-tab">
            <TabList className="tabs tab-title">
              <Tab
                className={activeTab == type ? "active" : ""}
                onClick={() => setActiveTab(type)}
              >
                NEW ARRIVAL
              </Tab>
              <Tab
                className={activeTab == "furniture" ? "active" : ""}
                onClick={() => setActiveTab("furniture")}
              >
                FEATURED{" "}
              </Tab>
              <Tab
                className={activeTab == "furniture" ? "active" : ""}
                onClick={() => setActiveTab("furniture")}
              >
                SPECIAL
              </Tab>
            </TabList>

            <TabPanel>
              <TabContent
                data={data}
                loading={loading}
                startIndex={0}
                endIndex={8}
                cartClass={cartClass}
                backImage={backImage}
              />
            </TabPanel>
            <TabPanel>
              <TabContent
                data={data}
                loading={loading}
                startIndex={0}
                endIndex={8}
                cartClass={cartClass}
                backImage={backImage}
              />
            </TabPanel>
            <TabPanel>
              <TabContent
                data={data}
                loading={loading}
                startIndex={0}
                endIndex={8}
                cartClass={cartClass}
                backImage={backImage}
              />
            </TabPanel>
          </Tabs>
        </Container>
      </section>
    </div>
  );
};

export default SpecialProducts;
