import React from 'react'
// import { Link } from 'react-router-dom';
// import '../styles/navbar.css';
// import ReorderIcon from '@material-ui/icons/Reorder';
// import { useState } from 'react';





//state is just a variable that when we change a value it shows changes we make

function Navbar() {
    // const [openlinks, setopenlinks] = useState(false)

    // const toggleNavbar = () => {
    //     setopenlinks(!openlinks)
    // };
  return (
    <div>
        {/* <div className='leftSide' id={openlinks ? "open" : "close"}>
            <img src={Logo} />
            <div className="hiddenLinks">
            <Link className='linkelement' to="/home">Home</Link>
            <Link className='linkelement' to="/menu">Menu</Link>
            <Link className='linkelement' to="/about">About</Link>
            <Link className='linkelement' to="/contact">Contact</Link>
            </div>
        </div>
        <div className='rightSide'>
            <Link className='linkelement' to="/home">Home</Link>
            <Link className='linkelement' to="/menu">Menu</Link>
            <Link className='linkelement' to="/about">About</Link>
            <Link className='linkelement' to="/contact">Contact</Link>
            <button onClick={toggleNavbar}>
                <ReorderIcon />
            </button>
        // </div> */}
    </div>
  );
}

export default Navbar
