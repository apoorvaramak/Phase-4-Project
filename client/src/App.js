import logo from './logo.svg';
import './App.css';
import {useEffect, useState} from 'react'

function App() {

  const [pets, setPets] = useState([])
  const [shelters, setShelters] = useState([])
  const [user, setUser] = useState(null)
  const [username, setUsername] = useState([])
  const [password, setPassword] = useState([])
  

    useEffect(() => {
      fetch("/pets")
        .then((response) => response.json())
        .then((data) => {
          setPets(data);
        });
    }, []);

    useEffect(() => {
      fetch("/shelters")
        .then((response) => response.json())
        .then((data) => {
          setShelters(data);
        });
    }, []);

    function handleSubmit(event){
      event.preventDefault()
      fetch("/pets", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: {
          name: pets
        }
      }).then(response => response.json())
      .then(data => setPets([... data]))
    }


    

    function handleSubmit(e) {
      e.preventDefault();
      fetch("/login", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ username, password }),
      }).then((r) => {
        if (r.ok) {
          r.json().then((user) => setUser(user));
        }
      });
    }
  
    return (
      <div>
        <form onSubmit={handleSubmit}>
          <h1>Login</h1>
          <label htmlFor="username">Username</label>
          <input
            type="text"
            id="username"
            autoComplete="off"
            value={username}
            onChange={(e) => setUsername(e.target.value)}
          />
          <label htmlFor="password">Password</label>
          <input
            type="password"
            id="password"
            autoComplete="current-password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
          <button type="submit">Login</button>
        </form>
      </div>
    );
}

export default App;
