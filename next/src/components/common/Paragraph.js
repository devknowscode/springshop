import React from 'react';
import { Container, Row, Col } from 'reactstrap';

const Paragraph = ({title, inner, line ,hrClass}) => {
    return (
        <>
            <div className={title}>
                <h4></h4>
                <h2 className={inner}>Bộ sưu tập</h2>
                {
                    line ?
                        <div className="line"></div> : 
                    hrClass ?
                        <hr role="tournament6"></hr>
                    : ''
                }
            </div>
            <Container>
                <Row>
                    <Col lg="6" className="m-auto">
                        <div className="product-para">
                            <p className="text-center">Các bộ sưu tập </p>
                        </div>
                    </Col>
                </Row>
            </Container>
        </>
    )
}

export default Paragraph;