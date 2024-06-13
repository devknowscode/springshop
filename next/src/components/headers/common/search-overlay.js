import { useRouter } from "next/navigation";
import React, { useState } from "react";
import {
  Button,
  Col,
  Container,
  Form,
  FormGroup,
  Input,
  Row,
} from "reactstrap";

const closeSearch = () => {
  document.getElementById("search-overlay").style.display = "none";
};
const SearchOverlay = () => {
  const router = useRouter();
  const [keyword, setKeyword] = useState("")

  const handleChange = (e) => {
    setKeyword(e.target.value)
  }

  const handleSubmit = (e) => {
    e.preventDefault();
    router.push(`/shop/left_sidebar?keyword=${keyword}`)
    closeSearch()
  }

  return (
    <div id="search-overlay" className="search-overlay">
      <div>
        <span className="closebtn" onClick={closeSearch} title="Close Overlay">
          ×
        </span>
        <div className="overlay-content">
          <Container>
            <Row>
              <Col xl="12">
                <Form onSubmit={handleSubmit}>
                  <FormGroup>
                    <Input
                      type="text"
                      className="form-control"
                      value={keyword}
                      onChange={handleChange}
                      id="exampleInputPassword1"
                      placeholder="Search a Product"
                    />
                  </FormGroup>
                </Form>
              </Col>
            </Row>
          </Container>
        </div>
      </div>
    </div>
  );
};

export default SearchOverlay;
