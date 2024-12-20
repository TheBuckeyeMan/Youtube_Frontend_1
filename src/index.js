import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
// import reportWebVitals from './reportWebVitals';
import { Route, BrowserRouter as Router, Routes} from 'react-router-dom';
import Home from './Pages/home';
import Journey from './Pages/journey';
import Metrics from './Pages/metrics';
import Header from "./Components/Header";
import Footer from "./Components/Footer";
import Navbar from "./Components/Navbar";




const routing = (
  <Router>
    <React.StrictMode>
      <Navbar />
      <Header />
        <Routes>
          <Route exact path = '/' element={<Home />} />
          <Route exact path = '/journey' element={<Journey />} />
          <Route exact path = '/metrics' element={<Metrics />} />
        </Routes>
      <Footer />
    </React.StrictMode>
  </Router>


)

ReactDOM.createRoot(document.getElementById('root')).render(routing)
