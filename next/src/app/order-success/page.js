"use client";

import { useState, useEffect } from "react";
import CommonLayout from "../../components/shop/common-layout";
import { Container, Row, Col } from "reactstrap";
import { useRouter } from "next/navigation";

const OrderSuccess = () => {
  const router = useRouter();
  const [countdown, setCountdown] = useState(5);

  useEffect(() => {
    // Set a timeout to redirect after 5 seconds (5000 milliseconds)
    const timer = setInterval(() => {
      setCountdown((prevCountdown) => prevCountdown - 1);
    }, 1000);

    const timeout = setTimeout(() => {
      router.push("/"); // Redirect to home
    }, 5000);

    // Cleanup the timeout if the component unmounts before the timeout completes
    return () => {
      clearInterval(timer);
      clearTimeout(timeout);
    };
  }, []);

  return (
    <CommonLayout parent="Trang chủ" title="Thanh toán thành công">
      <section className="section-b-space light-layout white-1">
        <Container>
          <Row>
            <Col md="12">
              <div className="success-text">
                <i className="fa fa-check-circle" aria-hidden="true"></i>
                <h2>Cảm ơn bạn đã đặt hàng</h2>
                <br />
                <p>Bạn sẽ chuyển về trang chủ trong {countdown} giây...</p>
              </div>
            </Col>
          </Row>
        </Container>
      </section>
    </CommonLayout>
  );
};

export default OrderSuccess;
