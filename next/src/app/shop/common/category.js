import React, { useState, useContext, useEffect } from "react";
import { Collapse } from "reactstrap";
import FilterContext from "../../../helpers/filter/FilterContext";
import axios from "axios";

const Category = () => {
  const context = useContext(FilterContext);
  const [isCategoryOpen, setIsCategoryOpen] = useState(true);
  const toggleCategory = () => setIsCategoryOpen(!isCategoryOpen);
  const setSelectedCategory = context.setSelectedCategory;
  const [categories, setCategories] = useState([]);

  useEffect(() => {
    axios
      .get(`http://localhost:8088/v1/api/categories`)
      .then(({ data }) => {
        setCategories(data.metadata);
      })
      .catch((e) => {
        console.log(e);
      });
  }, []);

  const updateCategory = (category) => {
    setSelectedCategory(category);
  };

  return (
    <>
      <div className="collection-collapse-block open">
        <h3 className="collapse-block-title" onClick={toggleCategory}>
          Category
        </h3>
        <Collapse isOpen={isCategoryOpen}>
          <div className="collection-collapse-block-content">
            <div className="collection-brand-filter">
              <ul className="category-list">
                {categories.map((category) => (
                  <li>
                    <a href={null} onClick={() => updateCategory(category.name)}>
                      {category.name}
                    </a>
                  </li>
                ))}
              </ul>
            </div>
          </div>
        </Collapse>
      </div>
    </>
  );
};

export default Category;
