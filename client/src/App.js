import React from 'react';
import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import OtherPage from './OtherPage';
import Fib from './Fib';

function App() {
  return (
    <Router>
      <div className="App">
        <div>
          <Link to="/">Home</Link>       
          <Link to="/otherpage">Other Page</Link>  
        </div>                                  
        <div>
          <Route exact path="/" component={Fib} />
          <Route exact path="/otherpage" component={OtherPage} />
        </div>
        <img src={logo} className="App-logo" alt="logo" />  
      </div>
    </Router>    
  );
}

export default App;
