import React from 'react'
import { Link } from 'react-router-dom'


const metrics = () => {
  return (
    <div>
        <div>
            <h1>Metrics Page</h1>
            <Link to="/"><button>Home</button></Link>
            <Link to="/journey"><button>journey</button></Link>
        </div>
      
    </div>
  )
}

export default metrics
