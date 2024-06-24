import React from "react";
import HeaderOne from "../headers/header-one";
import Breadcrubs from "../common/widgets/breadcrubs";
import MasterFooter from "../footers/common/MasterFooter";

const CommonLayout = ({ children, title, parent, subTitle }) => {
  return (
    <>
      <HeaderOne topClass="top-header" logoName="logo.png" />
      <Breadcrubs title={title} parent={parent} subTitle={subTitle} />
      <>{children}</>
      <br />
      <MasterFooter
        footerClass={`footer-light`}
        footerLayOut={"light-layout upper-footer"}
        footerSection={"small-section border-section border-top-0"}
        belowSection={"section-b-space light-layout"}
        newLatter={true}
      />
    </>
  );
};

export default CommonLayout;
