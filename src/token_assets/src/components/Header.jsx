import React from "react";

function Header() {
  return (
    <header>
      <div className="blue window" id="logo">
        <h1>
          <span role="img" aria-label="tap emoji">
            💎
          </span>
          DRivex Finance
        </h1>
        <p style ={{textAlign: "right"}}>By Aditya Mahekar</p>
      </div>
    </header>
  );
}

export default Header;
