import React from 'react';
import ReactDOM from 'react-dom';
// Modules:
// - Main App container
// - User Input UX
// - Drawing UX
import App from './modules/App'
import Setup from './modules/setup/Setup';
import Draw from './modules/draw/Draw';

// Render to HTML div
ReactDOM.render(
  <React.StrictMode>
    <App >
      <Setup />
      <Draw />
    </App>
  </React.StrictMode>,
  document.getElementById('root')
);
