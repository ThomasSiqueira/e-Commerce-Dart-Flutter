'use strict';
const functions = require('firebase-functions');
const nodemailer = require('nodemailer');
const admin = require('firebase-admin');
const { doc, updateDoc } = require('firebase-admin/firestore');
admin.initializeApp(functions.config().firebase);


const enviarEmail = ((corpo, assunto) => {
  var transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
      user: 'yakihiro.lol@gmail.com',
      pass: 'ruof prhp qnhs lzer'
    }
  });


  var mailOptions = {
    from: 'yakihiro.lol@gmail.com',
    to: 'thomassiqueira427@gmail.com',
    subject: assunto,
    text: corpo
  };

  transporter.sendMail(mailOptions, function (error, info) {
    if (error) {
      console.log(error);
    } else {
      console.log('Email sent: ' + info.response);
    }
  });
});


exports.supportChat = functions.firestore.document("messages/{docId}").onUpdate((snap, context) => {
  var msg = snap.after.data()['messages'][0];

  var corpo = "Menssagem de " + msg['author']['firstName'];
  if (msg['type'] == "text") {
    corpo = corpo + ": " + msg['text'];
  }

  enviarEmail(corpo, "assunto teste");

  var db = admin.firestore();
  var serverState = 0;
  db.collection("messageState").doc("decF1ilrDqSYJh0aMJee").get().then(snapshot => {

    console.log(snapshot.data())
    serverState = snapshot.data()['state']

    const docRef = db.collection("messageState").doc("decF1ilrDqSYJh0aMJee");

    docRef.set({
      state: serverState+1
    });
  }).catch(reason => {
    console.log(reason)
  })

})

exports.ServerState = functions.https.onRequest((request, response) => {
  var db = admin.firestore();
  var serverState = 0;


  db.collection("messageState").doc("decF1ilrDqSYJh0aMJee").get().then(snapshot => {

    console.log(snapshot.data())
    serverState = snapshot.data()['state']
    response.set('Access-Control-Allow-Origin', '*');
    response.send({ "state": serverState });
  }).catch(reason => {
    console.log(reason)
  })

});
