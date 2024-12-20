import React from 'react'
import { Link } from 'react-router-dom'


const journey = () => {
  return (
    <div>
      <div>
            <h1>Journey Page</h1>
            <Link to="/"><button>Home</button></Link>
            <Link to="/metrics"><button>metrics</button></Link>
        </div>
    </div>
  )
}

export default journey
