import logo from './logo.svg';
import './App.css';
import {BrowserRouter as Router, Routes, Route} from 'react-router-dom';
import HomePage from './Pages/HomePage';
import DetailPage from './Pages/DetailPage';
import InformationPage from './Pages/InformationPage';

function App() {
  return (
    <Router>
 
    <Routes>
    
    <Route path='/' element={<HomePage/>}/>
    <Route path='/detail' element={<DetailPage/>}/>
    <Route path='/information' element={<InformationPage/>}/>
    
    
    </Routes>
    </Router>
  );
}

export default App;
