var mysql = require("mysql");
var inquirer = require("inquirer");

// create the connection information for the sql database
var connection = mysql.createConnection({
  host: "localhost",

  // Your port; if not 3306
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: "root",
  database: "bamazon_DB"
});

// connect to the mysql server and sql database
connection.connect(function(err) {
  if (err) throw err;
  // run the start function after the connection is made to prompt the user
  buy();
});

function buy() {
  // query the database for all items being auctioned
  connection.query("SELECT item_name, quantity, inventory, price FROM selling", function(err, results) {
    if (err) throw err;
    // once you have the items, prompt the user for which they'd like to buy
    inquirer
      .prompt([
        {
          name: "choice",
          type: "rawlist",
          choices: function() {
            var choiceArrayItems = [];
            for (var i = 0; i < results.length; i++) {
              choiceArrayItems.push(results[i].item_name);
            }
            return choiceArrayItems;
          },
          message: "What item would you like to buy?"
        },

        {
          name: "quantity",
          type: "input",
          message: "How many do you want to buy?"
        }
      ]).then(function(answer) {
        // get the information of the chosen item
        var chosenItem;
        for (var i = 0; i < results.length; i++) {
          if (results[i].item_name === answer.choice) {
            chosenItem = results[i];
          }
        }  
        
        if (chosenItem.inventory > parseInt (answer.quantity)) {
          connection.query("UPDATE selling SET ? WHERE ?", [
            { inventory: chosenItem.inventory - parseInt(answer.quantity)},
            {item_name: chosenItem.item_name}
          ], function(error) {
            if (error) throw error;
            console.log("You bought " + parseInt(answer.quantity) + " " + chosenItem.item_name + "(s)");
            console.log("Your total is " + "$" + (chosenItem.price * parseInt(answer.quantity))); 
            console.log("There are " + (chosenItem.inventory - parseInt(answer.quantity)) + " out of " + parseInt(chosenItem.inventory) + " " + chosenItem.item_name + "s left.");   
          } 
        );
      }
    },
  )}
)}
