import React, { useContext } from 'react'
import { Outlet, Navigate } from 'react-router-dom'
import loginContext from '../context/loginContext'


const PrivateRoutes = () => {
  
  const authToken = useContext(loginContext)
  return (
    authToken.state.auth ? <Outlet /> : <Navigate to="/signin"></Navigate>
  )
}

export default PrivateRoutes