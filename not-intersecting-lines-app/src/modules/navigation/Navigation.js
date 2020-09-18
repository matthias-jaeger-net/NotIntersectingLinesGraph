import React from 'react';
import { Link } from "react-router-dom";

//import './Setup.css';

function Navigation() {
  return (
    <nav>
      <Link to="/">Home</Link>
      <Link to="/setup">Setup</Link>
      <Link to="/draw">Draw</Link>
    </nav>
  );
}

export default Navigation;
