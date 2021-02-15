const express = require('express');
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');
const session = require('express-session');
const cors = require('cors');
const app = express();
const mysql = require('mysql');
const bcrypt = require('bcrypt');

const saltRounds = 10;

const jwt = require('jsonwebtoken');

const db = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'loginsystem'
})

// EXPRESS FUNCTIONS

app.use(cors({
    origin: ['http://localhost:3000'],
    methods: ['GET', 'POST', 'PUT'],
    credentials: true
}));
app.use(express.json());
app.use(bodyParser.urlencoded({extended: true}))

app.use(cookieParser())

app.use(
    session({
        key: 'userId',
        secret: 'luan',
        resave: false,
        saveUninitialized: false,
        cookie: {
            expires: 60 * 60 * 24,

    }
}))

// REGISTER 

app.post('/api/register', (req, res) => {
    const login = req.body.regLogin;
    const password = req.body.regPassword;

    bcrypt.hash(password, saltRounds, (err, hash) => {
        if (err) {
            console.log(err)
        }

        db.query(
            "INSERT INTO users (user_login, user_password) VALUES (?,?)",
            [login, hash],
            (err, result) => {
                res.send({message: "Usuário registrado!"})
            }
        )
    })
})


// LOGIN SYSTEM


app.post('/api/login', (req, res) => {
    const login = req.body.login;
    const password = req.body.password;

    db.query(
        "SELECT * FROM users WHERE user_login = ?",
        login,
        (error, result) => {
            if (error) {
                res.send({ error: error })
            }

            if (result.length > 0) {
                bcrypt.compare(password, result[0].user_password, (error, response) => {
                    if (response) {
                        req.session.user = result;
                        res.send(result)
                    } else {
                        res.send({message: "Login ou senha incorretos!"})
                    }
                })
            } else {
                res.send({ message: "Usuário não encontrado!" })
            }
        }
    )

})

app.get('/api/login', (req, res) => {
    if (req.session.user) {
        res.send({loggedIn: true, user: req.session.user})
    } else {
        res.send({loggedIn: false})
    }
})


// POST REVIEW ON DATABASE

app.post('/api/insert', (req, res) => {

    const movieName = req.body.movieName;
    const movieReview = req.body.movieReview;

    const sqlINSERT = "INSERT INTO movie_reviews (movie_name, movie_review) VALUES (? , ?)"

    db.query(sqlINSERT, [movieName, movieReview], (err, result) => {
        console.log(result);
    })
})


// SEND REVIEWS TO FRONTEND

app.get('/api/get', (req, res) => {
    const sqlSELECT = "SELECT * FROM movie_reviews"

    db.query(sqlSELECT, (err, result) => {
        res.send(result);
    })
})


// DELETE REVIEWS

app.delete('/api/delete/:movieName', (req, res) => {
    const name = req.params.movieName;
    const sqlDELETE = "DELETE FROM movie_reviews WHERE movie_name = ?"

    db.query(sqlDELETE, name, (error, result) =>  {
       if (error) console.log(error)
    })
})

// UPDATE REVIEWS

app.put('/api/update/', (req, res) => {
    const name = req.body.movieName;
    const review = req.body.movieReview;
    const sqlUPDATE = "UPDATE movie_reviews SET movie_review = ? WHERE movie_name = ?"

    db.query(sqlUPDATE, [review, name], (error, result) =>  {
       if (error) console.log(error)
    })
})


// LISTENING PORT

app.listen(3001, ()=> {
    console.log('running on port 3001');
})