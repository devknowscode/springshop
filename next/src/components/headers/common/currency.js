import React, { useContext } from "react";
import { Media } from "reactstrap";
import language from "../../constant/langConfig.json";
import i18next from "../../constant/i18n";
import { CurrencyContext } from "../../../helpers/Currency/CurrencyContext";

const Currency = ({ icon }) => {
  var data = {
    "getCurrency": [
          {
            "currency": "USD",
            "name": "doller",
            "symbol": "$",
            "value": 1
          },
          {
            "currency": "IND",
            "name": "rupees",
            "symbol": "₹",
            "value": 60
          },
          {
            "currency": "EUR",
            "name": "euro",
            "symbol": "€",
            "value": 52
          },
          {
            "currency": "GBP",
            "name": "pound",
            "symbol": "£",
            "value": 62
          }
        ]  
    };

  const Context = useContext(CurrencyContext);
  const selectedCurrency = Context.currencyContext.selectedCurrency;

  console.log("data", data);

  const changeLanguage = (lng) => {
    i18next.changeLanguage(lng);
  };

  return (
    <li className="onhover-div mobile-setting">
      <div>
        <Media src={icon} className="img-fluid" alt="" />
        <i className="fa fa-cog"></i>
      </div>
      <div className="show-div setting">
        <h6>language</h6>
        <ul>
          {language.map((item, i) => (
            <li key={i}>
              <a
                href={null}
                onClick={() => {
                  changeLanguage(item.val);
                }}>
                {item.lang}
              </a>
            </li>
          ))}
        </ul>
        <h6>currency</h6>
        <ul className="list-inline">
          {data &&
            data.getCurrency.map((cur, i) => (
              <li key={i}>
                <div onClick={() => selectedCurrency(cur)}>
                  {cur.symbol} {cur.currency}
                </div>
              </li>
            ))}
        </ul>
      </div>
    </li>
  );
};

export default Currency;
