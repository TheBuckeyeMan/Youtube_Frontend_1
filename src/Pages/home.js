import React from 'react'
import { Link } from 'react-router-dom'


const home = () => {
  return (
    <div>
        <div>
            <h1>Home Page</h1>
            <Link to="/journey"><button>journey</button></Link>
            <Link to="/metrics"><button>metrics</button></Link>
        </div>
      
    </div>
  )
}

export default home
