
	var saucesList = [];
	var pizzaSizesList = [];

	function addIngredientToPizza(ingredientId, actionType) {
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
	
	function drawIngredient(databaseId, name) {
		var div = document.createElement("div");

		div.setAttribute('data-databaseId', databaseId);
		div.className = 'skladnik ' + name.latinise();
		var skladniki = document.getElementById("skladniki");
		skladniki.appendChild(div);
	}
	
	function drawSauce() {
		var sauce = document.getElementById("sos");
		var type = sauce.className;
		var sauceObject = findElementByValue(type, saucesList);
		var newSauceObject = saucesList[(sauceObject.index+1)%saucesList.length];
		
		//remove current sauce from order
		addIngredientToPizza(sauceObject.databaseId, 'delete');
		
		//draw next sauce
		sauce.className = newSauceObject.name;
		
		//add new sauce to order
		addIngredientToPizza(newSauceObject.databaseId, 'add');
	}
	
	function changePizzaSize() {
		var pizza = document.getElementById("ciasto");
		var type = pizza.className.split(" ")[0];
		var pizzaObject = findElementByValue(type, pizzaSizesList);
		var newPizzaObject = pizzaSizesList[(pizzaObject.index+1)%pizzaSizesList.length];
		
		//remove current pizza from order
		addIngredientToPizza(pizzaObject.databaseId, 'delete');
		
		//draw next pizza
		pizza.className = pizza.className.replace(type, newPizzaObject.name);
		
		//add new pizza to order
		addIngredientToPizza(newPizzaObject.databaseId, 'add');
	}
	
	function addSauce(databaseId, name) {
		saucesList.push({
			index: saucesList.length,
			databaseId: databaseId, 
			name: name.toLowerCase().replace(' ', '').replace('sos', '').latinise()
		});
	}
	
	function addPizzaSize(databaseId, name) {
		pizzaSizesList.push({
			index: pizzaSizesList.length,
			databaseId: databaseId, 
			name: name.toLowerCase().replace(' ', '').replace('spód', '').latinise()
		});
	}
	
	function findElementByValue(value, list) {
		for (var i = 0; i<list.length; i++) {
			var object = list[i];
			for (var key in object) {
				console.log('value ' + value + ' || object[key] ' + object[key]);
				if (value === object[key]) {
					return object;
				}
			}
		}
		return {};
	}
	
	function addCurrentPizzaOrSauceToOrder(elementId, elementList) {
		var element = document.getElementById(elementId);
		var type = element.className.split(" ")[0];
		var object = findElementByValue(type, elementList);
		
		//add to order
		addIngredientToPizza(object.databaseId, 'add');
	}

$( document ).ready(function() {
	
	addCurrentPizzaOrSauceToOrder('ciasto', pizzaSizesList);
	addCurrentPizzaOrSauceToOrder('sos', saucesList);

	///////////////////////////////////////////////////////////////////////////////////////////
	
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
			var id = ui.draggable.attr('data-databaseId');
			
			stworzSkladnik(nazwaSkladnika).appendTo("#ciasto");
			ui.draggable.addClass('naPizzy');
			ui.draggable.draggable( "disable" );
			addIngredientToPizza(id, 'add');
		}
	});
	
	///////////////////////////////////////////////////////////////////////////////////////////
	
	$( ".skladnik" ).click(function() {
		if ($(this).attr("class").indexOf("naPizzy") > -1) {
			$(this).removeClass('naPizzy');
			$( "#ciasto > .skladnikNaPizzy." + $(this).attr("class").split(" ")[1]).remove();
			$(this).draggable( "enable" );
			var id = $(this).attr('data-databaseId');
			addIngredientToPizza(id, 'delete');
		}
	});

	///////////////////////////////////////////////////////////////////////////////////////////

	$( "#sos" ).click(function() {
		drawSauce();
	});
	
	///////////////////////////////////////////////////////////////////////////////////////////

	$( "#ciasto" ).click(function() {
		changePizzaSize();
	});
	
});