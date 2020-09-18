import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

// Modules:
// - Main App container
// - User Input UX
// - Drawing UX
import App from './modules/App';
import Navigation from './modules/navigation/Navigation';
import Setup from './modules/setup/Setup';
import Draw from './modules/draw/Draw';


// Render to HTML div
ReactDOM.render(
  <React.StrictMode>
    <Router>
      <Navigation />
      <Switch>
        <Route exact path="/" component={App} />
        <Route exact path="/setup" component={Setup} />
        <Route exact path="/draw" component={Draw} />
      </Switch>
    </Router>
  </React.StrictMode >,
  document.getElementById('root')
);
