import React, { useState } from 'react'
import LoginContext from './loginContext'

const LoginState = (props) => {
  const initialState = {
    "auth": false
  }
  const [state, setState] = useState(initialState)
  const update = (isAuthenticated) => {
    setState(isAuthenticated)
  }
  return (
    <LoginContext.Provider value={{state, update}}>
      {props.children}
    </LoginContext.Provider>
  )
}
export default LoginState