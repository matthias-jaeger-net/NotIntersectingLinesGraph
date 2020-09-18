import React from 'react';

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = { date: new Date() };
  }
  render() {
    return (
      <div> App </div >
    );
  }


}


export default App;
