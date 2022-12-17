import { Route, Routes } from 'react-router-dom';
import './App.css';
import Account from './pages/Account';
import LogIn from './pages/LogIn';
import Home from './pages/Home';
import Navbar from './components/Navbar';
import SignUp from './pages/SignUp';
// import PrivateRoutes from './privateRoutes/PrivateRoutes';

function App() {
  return (
      <div className="App">
        <Navbar />
        <Routes>
          {/* <Route element={<PrivateRoutes />}>
            <Route element={<Account />} path="/account" />
          </Route> */}
          <Route path='/account' element={<Account/>} />
          <Route path='/' element={<Home />} />
          <Route path='/signin' element={<LogIn />} />
          <Route path='/signup' element={<SignUp />} />
        </Routes>
      </div>
  );
}

export default App;
