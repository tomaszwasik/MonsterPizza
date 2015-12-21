///////////////////////////////////////////////////////////////////////////////////
// DATA
///////////////////////////////////////////////////////////////////////////////////

var ingredients = [];
var sauces = [];
var pizzaSizes = [];
var ordered = [];

var all = {
	ingredientsArray : {
		desc : 'Contains all ingredients from menu',
		array : ingredients
	},
	saucesArray : {
		desc : 'Contains all sauces available in menu',
		array : sauces
	},
	pizzaSizesArray : {
		desc : 'Contains all pizza sizes available in menu',
		array : pizzaSizes
	},
	orderedArray : {
		desc : 'Contains ordered ingredients ',
		array : ordered
	}
}

var ACTION_ADD_INGREDIENT = 'add';
var ACTION_DELETE_INGREDIENT = 'delete';

var PIZZA_OR_SAUCE = [ 'spód', 'sos' ];
var PIZZA_SIZE = PIZZA_OR_SAUCE[0];
var SAUCE = PIZZA_OR_SAUCE[1];

var INGREDIENT_DATABASE_ID_ATTRIBUTE = 'data-databaseId';
var INGREDIENT_CLASSNAME = 'skladnik';
var INGREDIENT_DROPPED_CLASSNAME = 'naPizzy';
var PIZZA_AREA_ID = 'ciasto';
var INGREDIENT_ON_PIZZA_CLASSNAME = 'skladnikNaPizzy';

var SCRIPT = '<script>';

// /////////////////////////////////////////////////////////////////////////////////
// MAIN CODE
// /////////////////////////////////////////////////////////////////////////////////

$( document ).ready(function() {
	onSauceChange(false);
	drawPizzaSize(false);
	
	var stworzSkladnik = function(skladnikNazwa) {

		var skladnik = jQuery('<div/>', {
			class: skladnikNazwa + ' skladnikNaPizzy'
		});
		return skladnik;		
	}
	
	$( "#skladniki > .skladnik" ).draggable({
		appendTo: "body",
		helper: "clone",
		cursor: 'pointer',
		start: function() {
			$('#stol').addClass('dragstart');
		},
		stop: function() {
			$('#stol').removeClass('dragstart');
		}
	});
	

	$( "#ciasto" ).droppable({
		drop: function(ev, ui) {
			var nazwaSkladnika = ui.draggable.attr("class").split(" ")[1];
			
			stworzSkladnik(nazwaSkladnika).appendTo("#ciasto");
			ui.draggable.addClass('naPizzy');
			ui.draggable.draggable( "disable" );

			// MANAGE DATA: add ingredient
			var id = ui.draggable.attr(INGREDIENT_DATABASE_ID_ATTRIBUTE);
			addIngredientToOrder(id, false);
		}
	});

	///////////////////////////////////////////////////////////////////////////////////////////
	
	$( ".skladnik" ).click(function() {
		if ($(this).attr("class").indexOf("naPizzy") > -1) {
			$(this).removeClass('naPizzy');
			$( "#ciasto > .skladnikNaPizzy." + $(this).attr("class").split(" ")[1]).remove();
			$(this).draggable( "enable" );

			// MANAGE DATA: remove ingredient
			var id = $(this).attr(INGREDIENT_DATABASE_ID_ATTRIBUTE);
			removeIngredientFromOrder(id);
		}
	});

	///////////////////////////////////////////////////////////////////////////////////////////

	$( "#sos" ).click(function() {
		onSauceChange(true);
	});
	
	///////////////////////////////////////////////////////////////////////////////////////////

	$( "#ciasto" ).click(function() {
		drawPizzaSize(true);
	});
});


///////////////////////////////////////////////////////////////////////////////////
// MANAGE DATA
///////////////////////////////////////////////////////////////////////////////////

function addIngredientToList(dbId, dbName) {
	ingredients.push({
		dbId : dbId,
		dbName : dbName,
		css : convertToCSS(dbName)
	});

	var ingredient = ingredients[ingredients.length - 1];
	var isOneWayChooseIngredient = isPizzaOrSauce(ingredient);
	
	if (isOneWayChooseIngredient.length > 0) {
		// is pizza size
		if (isOneWayChooseIngredient === PIZZA_SIZE) {
			pizzaSizes.push({
				index : pizzaSizes.length,
				dbId : dbId
			})
			onPizzaSizeChange();
		}
		// is sauce
		if (isOneWayChooseIngredient === SAUCE) {
			sauces.push({
				index : sauces.length,
				dbId : dbId
			})
		}
	}
	else {
		onIngredientChange(ingredient);
	}
}

function addIngredientToOrder(dbId, fromSession) {
	console.debug("*** addIngredientToOrder(" + dbId + ", " + fromSession +")");	

	var ingredient = getIngredientById(dbId, ordered);
	
	if (!ingredient) {
		ordered.push({
			dbId : dbId
		});
		onOrderedIngredientChange(dbId, ACTION_ADD_INGREDIENT, fromSession);
	}
}

function removeIngredientFromOrder(dbId) {
	console.debug("*** removeIngredientFromOrder");	
	var ingredient = getIngredientById(dbId, ordered);
	
	// if there is an ingredient ordered
	if (ingredient) {
		var index = ordered.indexOf(ingredient);
		ordered.splice(index, 1);
		onOrderedIngredientChange(dbId, ACTION_DELETE_INGREDIENT, false);
	}
	
}

// /////////////////////////////////////////////////////////////////////////////////
// TRIGGERS
// /////////////////////////////////////////////////////////////////////////////////

function onIngredientChange(ingredient) {
		drawIngredient(ingredient);
}

function onSauceChange(click) {
	drawSauce(click);
}

function onPizzaSizeChange(click) {
	drawPizzaSize(click)
}

function onOrderedIngredientChange(dbId, type, fromSession) {
	console.debug("*** onOrderedIngredientChange(" + dbId + ", " + type + ", " + fromSession + ")");
	if (!fromSession) {
		if (type === ACTION_ADD_INGREDIENT || type === ACTION_DELETE_INGREDIENT) {
			callWS(dbId, type)
		}
		else {
			console.warn("onOrderedIngredientChange: wrong action type: " + type);
		}
	}

	if (type === ACTION_ADD_INGREDIENT) {
		var ingredient = getIngredientById(dbId, ingredients);
		drawIngredientOnPizza(ingredient.dbName);
		drawIngredientOnList(ingredient.dbName);
	}
	
//	showArrays();
}

// /////////////////////////////////////////////////////////////////////////////////
// DRAW A VIEW
// /////////////////////////////////////////////////////////////////////////////////

function drawIngredient(ingredient) {
	var ingredientsDiv = document.getElementById("skladniki");
	var ingredientDiv = document.createElement("div");

	ingredientDiv.setAttribute(INGREDIENT_DATABASE_ID_ATTRIBUTE, ingredient.dbId);
	ingredientDiv.className = INGREDIENT_CLASSNAME + ' ' + convertToCSS(ingredient.dbName);
	ingredientsDiv.appendChild(ingredientDiv);
}

function drawIngredientOnPizza(dbName) {
	console.debug('***drawIngredientOnPizza(' + dbName + ")");
	var pizzaDiv = document.getElementById(PIZZA_AREA_ID);
	var ingredientDiv = document.createElement("div");
	ingredientDiv.className = INGREDIENT_ON_PIZZA_CLASSNAME + ' ' + convertToCSS(dbName);
	pizzaDiv.appendChild(ingredientDiv);
}

function drawIngredientOnList(dbName) {
	console.debug('***drawIngredientOnList(' + dbName + ")");
	var ingredientsDiv = document.getElementById("skladniki");
	
	for (var i = 0 ; i < ingredientsDiv.children.length; i++) {
//		console.debug(ingredientsDiv.children[i].toString() )
//		console.debug(ingredientsDiv.children[i].className )
		
		if (ingredientsDiv.children[i].toString().indexOf(SCRIPT) === -1 
				&& ingredientsDiv.children[i].className.indexOf(convertToCSS(dbName)) > 1) {
			var ingredient = ingredientsDiv.children[i];

//			console.log(ingredientsDiv.children[i])
			ingredient.className += ' ' + INGREDIENT_DROPPED_CLASSNAME;
			
		}
	}
}

function drawSauce(clicked) {
	console.debug('***drawSauce(' + clicked + ')');
	var sauce = document.getElementById(SAUCE);
	var type = sauce.className;
	
	var currentSauce;
	var newSauce;

	// id sauce defined
	if (type) {
		console.debug('type of sauce defined as ' + type);
		currentSauce = getIngredientById((getIngredientByName(type, ingredients).dbId), sauces);
	}
	// if we have to define
	else {
		// check if sauce is ordered
		var orderedSauce = -1;
		
		for (var i = 0 ; i < sauces.length; i++) {
			for (var j = 0 ; j < ordered.length; j++) {
				if (sauces[i].dbId === ordered[j].dbId) {
					orderedSauce = sauces[i];
				}
			}
		}
		
		if (orderedSauce !== -1) {
			console.debug('type of sauce not defined, but found in ordered ingredients id=' + orderedSauce.dbId);
			currentSauce = getIngredientById(orderedSauce.dbId, sauces);
		}
		else {
			console.debug('type of sauce not defined and has to be defined as default one');
			newSauce = getIngredientById(sauces[0].dbId, ingredients);
		}
	}
//	
//	console.debug('currentSauce and newSauce')
//	console.log(currentSauce);
//	console.log(newSauce);
	
	if (!newSauce && clicked) {
		var dbId = (sauces[(currentSauce.index+1)%sauces.length]).dbId;
		newSauce = getIngredientById(dbId, ingredients);
		console.log(newSauce);
		
		//remove current sauce from order
		removeIngredientFromOrder(currentSauce.dbId, 'delete');
	}
	else if (!newSauce && !clicked) {
		newSauce = getIngredientById(currentSauce.dbId, ingredients);
	}
	
	//draw next sauce
	sauce.className = newSauce.css;
	
	//add new sauce to order
	addIngredientToOrder(newSauce.dbId, false);
}

function drawPizzaSize(clicked) {
	var pizza = document.getElementById(PIZZA_AREA_ID);
	
	if (pizza) {
		var type = pizza.className;
		
	
		var currentPizzaSize;
		var newPizzaSize;
	
		// id pizza size defined
		if (type) {
			type = type.split(" ")[0];
			console.debug('type of pizza size defined as ' + type);
			currentPizzaSize = getIngredientById(getIngredientByName(type, ingredients).dbId, pizzaSizes);
		}
		// if we have to define
		else {
			// check if sauce is ordered
			var orderedPizzaSize = -1;
			
			for (var i = 0 ; i < pizzaSizes.length; i++) {
				for (var j = 0 ; j < ordered.length; j++) {
					if (pizzaSizes[i].dbId === ordered[j].dbId) {
						orderedPizzaSize = pizzaSizes[i];
					}
				}
			}
			
			if (orderedPizzaSize !== -1) {
				console.debug('type of pizza size  not defined, but found in ordered ingredients id=' + orderedPizzaSize.dbId);
				currentPizzaSize = getIngredientById(orderedPizzaSize.dbId, pizzaSizes);
			}
			else {
				console.debug('type of pizza size not defined and has to be defined as default one');
				newPizzaSize = getIngredientById(pizzaSizes[0].dbId, ingredients);
			}
		}
	//	
	//	console.debug('currentSauce and newSauce')
	//	console.log(currentSauce);
	//	console.log(newSauce);
		
		if (!newPizzaSize && clicked) {
			var dbId = (pizzaSizes[(currentPizzaSize.index+1)%pizzaSizes.length]).dbId;
			newPizzaSize = getIngredientById(dbId, ingredients);
			console.log(newPizzaSize);
			
			//remove current sauce from order
			removeIngredientFromOrder(currentPizzaSize.dbId, 'delete');
		}
		else if (!newPizzaSize && !clicked) {
			newPizzaSize = getIngredientById(currentPizzaSize.dbId, ingredients);
		}
		
		//draw next sauce
		pizza.className = newPizzaSize.css;
		
		//add new sauce to order
		addIngredientToOrder(newPizzaSize.dbId, false);
	}
}

// /////////////////////////////////////////////////////////////////////////////////
// CHECKS
// /////////////////////////////////////////////////////////////////////////////////

function isPizzaOrSauce(ingredient) {
	if (ingredient.dbName.toLowerCase().indexOf(PIZZA_SIZE) > -1) {
		return PIZZA_SIZE;
	} else if (ingredient.dbName.toLowerCase().indexOf(SAUCE) > -1) {
		return SAUCE;
	}
	return '';
}

// /////////////////////////////////////////////////////////////////////////////////
// UTILS
// /////////////////////////////////////////////////////////////////////////////////

function convertToCSS(name) {
	return name.toString().toLowerCase().replace(' ', '').replace(PIZZA_SIZE,
			'').replace(SAUCE, '').latinise();
}

function getIngredientById(dbId, array) {
	for (var i = 0; i < array.length; i++) {
		var object =  array[i];
		for (var key in object) {
			if (key === 'dbId' && object[key] === dbId) {
				console.debug('SUCCESS ' + object.dbId);
				return object;
			}
		}
	}
	console.debug('getIngredientById: No ingredient with given id ' + dbId);
}

function getIngredientByName(dbName, array) {
	for (var i = 0; i < array.length; i++) {
		var object =  array[i];
		for (var key in object) {
			if ((key === 'dbName' || key === 'css') && object[key] === dbName) {
				console.debug('SUCCESS ' + object.dbName);
				return object;
			}
		}
	}
	console.debug('getIngredientByName: No ingredient with given dbName ' + dbName);
}

function callWS(ingredientId, actionType) {

	console.debug('***callWS(' + ingredientId + ', ' + actionType + ')');
	var xmlhttp;
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	} else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("myDiv").innerHTML = xmlhttp.responseText;
		}};
	var params = "ingredient_id=" + ingredientId + "&action=" + actionType;
	xmlhttp.open("GET", "ingredientToPizza?" + params, true);
	xmlhttp.send();
}

// /////////////////////////////////////////////////////////////////////////////////
// DEBUG
// /////////////////////////////////////////////////////////////////////////////////

function showArrays() {
	for ( var key in all) {
		var object = all[key];
		console.debug(key + ": " + object.desc);
		console.debug(object.array);
		console.debug('-------------------------------------');
	}
}