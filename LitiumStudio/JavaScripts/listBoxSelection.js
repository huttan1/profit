	    // JAVASCRIPT LISTBOX SELECTION - START 
	    // Moves users from the list containing all users to the group's list of members.
        // Makes use of "UserExistsInSelected" to check that a user doesn't already exist.
        function MoveFromExisting()
        {
            // Get selected items
            var itemsToMove = c_gridExistingItems.getSelectedItems();
            
            if(itemsToMove.length > 0)
            {
                for(var i = 0; i < itemsToMove.length; i++)
                {
                    // Check that the user doesn't already exists
                    var checkIfExists = false;
                    checkIfExists = UserExistsInSelected(itemsToMove[i].getMember('Id').get_text());
                    
                    if(checkIfExists == false)
                    {
                        // Add new empty row
                        c_gridSelectedItems.Table.AddRow();
                        
                        // Get new row and values to set
                        var newRowIndex = c_gridSelectedItems.Levels[0].Table.GetRowCount()-1;
                        var rowChild = c_gridSelectedItems.Levels[0].Table.GetRow(newRowIndex);
                        var nameValue = itemsToMove[i].getMember('Name').get_text();
                        var idValue = itemsToMove[i].getMember('Id').get_text();
                        
                        // Set values to the new row
                        rowChild.SetValue(0, idValue);
                        rowChild.SetValue(1, nameValue);
                        c_gridSelectedItems.Edit(rowChild);
                    }
                } 
                // Delete from source grid
                c_gridExistingItems.deleteSelected();
                // Sort destination grid ascending
                c_gridSelectedItems.sort(1, false);
                // Do postback
                //c_gridSelectedItems.postback();
            }
        }
        
        // Compare id of incoming item and target list.
        function UserExistsInSelected(itemID)
        {
            var exists = false;
            // Search target list for the incoming id
            for(var i = 0; i < c_gridSelectedItems.Levels[0].Table.GetRowCount(); i++)
            {
                if(itemID == c_gridSelectedItems.Levels[0].Table.GetRow(i).getMember('Id').get_text())
                {
                    exists = true;
                }
            }
            return exists;
        }
	
	    // Moves users from the list containing the group's members to list of all members.
        // Makes use of "UserExistsInExisting" to check that a user doesn't already exist.
        function MoveFromSelected()
        {
            // Get selected items
            var itemsToMove = c_gridSelectedItems.getSelectedItems();
            
            if(itemsToMove.length > 0)
            {
                for(var i = 0; i < itemsToMove.length; i++)
                {
                    // Check that the user doesn't already exists
                    var checkIfExists = false;
                    checkIfExists = UserExistsInExisting(itemsToMove[i].getMember('Id').get_text());
                    
                    if(checkIfExists == false)
                    {
                        // Add new empty row
                        c_gridExistingItems.Table.AddRow();
                        
                        // Get new row and values to set
                        var newRowIndex = c_gridExistingItems.Levels[0].Table.GetRowCount()-1;
                        var rowChild = c_gridExistingItems.Levels[0].Table.GetRow(newRowIndex);
                        var nameValue = itemsToMove[i].getMember('Name').get_text();
                        var idValue = itemsToMove[i].getMember('Id').get_text();
                        
                        // Set values to the new row
                        rowChild.SetValue(0, idValue);
                        rowChild.SetValue(1, nameValue);
                        c_gridExistingItems.Edit(rowChild);
                    }
                } 
                // Delete from source grid
                c_gridSelectedItems.deleteSelected();
                // Sort destination grid ascending
                c_gridExistingItems.sort(1, false);
                // Do postback
                //c_gridExistingItems.postback();
            }
        }
        
        // Compare id of incoming item and target list.
        function UserExistsInExisting(itemID)
        {
            var exists = false;
            // Search target list for the incoming id
            for(var i = 0; i < c_gridExistingItems.Levels[0].Table.GetRowCount(); i++)
            {
                if(itemID == c_gridExistingItems.Levels[0].Table.GetRow(i).getMember('Id').get_text())
                {
                    exists = true;
                }
            }
            return exists;
        }
        
        // Store id's to hidden field
        function StoreItems(hiddenFieldID, delimiterSign) 
        {
            var hiddenField, hiddenFieldString
		    hiddenField = document.getElementById(hiddenFieldID);
            hiddenFieldString = "";
            
            // Store all id's in a comma separated string
		    for(var i = 0; i < c_gridSelectedItems.Levels[0].Table.GetRowCount(); i++)
		    {
		        hiddenFieldString += c_gridSelectedItems.Levels[0].Table.GetRow(i).getMember('Id').get_text() + delimiterSign;
		    }
		    hiddenField.value = hiddenFieldString;
	    }
	
	
	
	
	
	
	
	
	
	
	/* MoveItem
	* Used to move the items from an input field to an other.
	* Uses SortField to sort both input fields after the operation.
	*/
	function MoveItem(fromFieldName,toFieldName) {
		var tmpOption, tmpValue, text, selectedIndex, fromField, toField, i, fieldStrang;
		fromField = document.getElementById(fromFieldName);
		toField = document.getElementById(toFieldName);
		selectedIndex = fromField.selectedIndex; 
		if (selectedIndex == -1) return;
		i=fromField.options.length-1;
		while (i >= 0){
			if(fromField.options[i].selected) {
				text = fromField.options[i].text;
				tmpValue = fromField.options[i].value;
				tmpOption = new Option(text, tmpValue, false, false);
				toField.options[toField.options.length] = tmpOption;
				fromField.remove(i);
			}
			i--;
		}
		SortField(toFieldName);
	}

   /*
	* SortField
	* Sorts the fields in alphabetical order
	*/
	function SortField(fieldName) {
		var tmpOption, tmpValueArray, sortField, sortedField, i, sortArray;
		sortField = document.getElementById(fieldName);
		
		i=0;
		sortArray=new Array();
		
		//  Create en array containing {text:value}-strings. Empty the selected field. 
		while (i < sortField.options.length) {
			sortArray[i] = sortField.options[i].text + "§" + sortField.options[i].value;
			i++;
		}
		
		//  Sort the array. 
		sortArray.sort();
		
		// Update selected field with the values from the sorted array. 
		for (i=0;i < sortArray.length; i++) {
			tmpValueArray = sortArray[i].split("§");
			tmpOption = new Option(tmpValueArray[0], tmpValueArray[1], false, false);
			sortField.options[i] = tmpOption;		
		}
	}
	
	/* 
	 * StoreSelectedItems	
	 * Store the value of the selected fields into a hidden field as delimiterStr separated string.
	 */
	function StoreSelectedItems(selectedFieldName, hiddenFieldName, delimiterStr) {
		var selectedField, hiddenField, hiddenFieldString
		selectedField = document.getElementById(selectedFieldName);
		hiddenField = document.getElementById(hiddenFieldName);
		
		i = 0;
		hiddenFieldString = "";
		while (i < selectedField.options.length) {
			hiddenFieldString += selectedField.options[i].value + delimiterStr;
			i++;
		}
		hiddenField.value = hiddenFieldString;
	}

	function MoveColumnSettingsItem(add, fromFieldName, toFieldName) {
	    var tmpOption, tmpValue, text, selectedIndex, fromField, toField, i, fieldStrang;
	    fromField = document.getElementById(fromFieldName);
	    toField = document.getElementById(toFieldName);
	    selectedIndex = fromField.selectedIndex;
	    if (selectedIndex == -1) return;
	    //if (add || ( fromField.options[selectedIndex].value != 'S_FirstName' && fromField.options[selectedIndex].value != 'S_LastName')) 
	    //{
	    i = fromField.options.length - 1;
	    while (i >= 0) {
	        if (fromField.options[i].selected) {
	            text = fromField.options[i].text;
	            tmpValue = fromField.options[i].value;
	            tmpOption = new Option(text, tmpValue, false, false);
	            toField.options[toField.options.length] = tmpOption;
	            fromField.remove(i);
	        }
	        i--;
	    }
	    //}
	}

	function MoveAlternativeUp(affectedFieldName) {
	    var affectedField = document.getElementById(affectedFieldName);
	    var selectedIndex = affectedField.selectedIndex;
	    if (selectedIndex == -1) return;

	    i = affectedField.options.length - 1;
	    for (i = affectedField.options.length - 1; i >= 0; i--) {
	        if (affectedField.options[i].selected) {
	            var currentSelectedItem = i;
	            while (currentSelectedItem >= 0 && affectedField.options[currentSelectedItem].selected) {
	                currentSelectedItem--;
	            }
	            if (currentSelectedItem >= 0) {
	                var previousOption = affectedField.options[currentSelectedItem];
	                for (var j = currentSelectedItem; j < i; j++) {
	                    var currentOption = affectedField.options[j + 1];
	                    affectedField.options[j] = new Option(currentOption.text, currentOption.value, false, false);
	                    affectedField.options[j].selected = true;
	                }
	                affectedField.options[i] = new Option(previousOption.text, previousOption.value, false, false);
	                i = currentSelectedItem;
	            }
	        }
	    }        
	}

	function MoveAlternativeDown(affectedFieldName) {
	    var affectedField = document.getElementById(affectedFieldName);
	    var selectedIndex = affectedField.selectedIndex;
	    if (selectedIndex == -1) return;

	    var maxOptionIndex = affectedField.options.length - 1;
	    for (i = 0; i < affectedField.options.length; i++) {
	        if (affectedField.options[i].selected) {
	            var currentSelectedItem = i;
	            while (currentSelectedItem < affectedField.options.length && affectedField.options[currentSelectedItem].selected) {
	                currentSelectedItem++;
	            }
	            if (currentSelectedItem < affectedField.options.length) {
	                var previousOption = affectedField.options[currentSelectedItem];
	                for (var j = currentSelectedItem; j > i; j--) {
	                    var currentOption = affectedField.options[j - 1];
	                    affectedField.options[j] = new Option(currentOption.text, currentOption.value, false, false);
	                    affectedField.options[j].selected = true;
	                }
	                affectedField.options[i] = new Option(previousOption.text, previousOption.value, false, false);
	                i = currentSelectedItem;
	            }
	        }
	    }        
	}

	//Moving an existing role when assigning roles to a person.
	function MoveExistingRoles(ExistingOrgs, ExistingRoles, SelectedRoles, Delimiter2) {
	    var existingOrgs = document.getElementById(ExistingOrgs);
	    var existingRoles = document.getElementById(ExistingRoles);
	    var selectedRoles = document.getElementById(SelectedRoles);
	    var selectedOrgsIndex = existingOrgs.selectedIndex;
	    var selectedRolesIndex = existingRoles.selectedIndex;
	    if (selectedOrgsIndex == -1 || selectedRolesIndex == -1) return;
	    else {
	        var tmpValue = existingOrgs.options[selectedOrgsIndex].value + Delimiter2 + existingRoles.options[selectedRolesIndex].value;
	        var foundInSelectedList = false;
	        for (var i = (selectedRoles.options.length - 1); i >= 0; i--) {
	            if (selectedRoles.options[i].value == tmpValue) foundInSelectedList = true;
	        }
	        if (!foundInSelectedList) {
	            var tmpText = existingRoles.options[selectedRolesIndex].text + " (" + existingOrgs.options[selectedOrgsIndex].text + ")";
	            var tmpOption = new Option(tmpText, tmpValue, false, false);
	            selectedRoles.options[selectedRoles.options.length] = tmpOption;
	            existingRoles.remove(selectedRolesIndex);
	        }
	    }
	    SortField(SelectedRoles);
	}

	//Removing a selected role when assigning roles to a person.
	function RemoveSelectedRoles(ExistingOrgs, ExistingRoles, SelectedRoles, HiddenExistingRoles, Delimiter1, Delimiter2) {
	    var existingOrgs = document.getElementById(ExistingOrgs);
	    var existingRoles = document.getElementById(ExistingRoles);
	    var selectedRoles = document.getElementById(SelectedRoles);
	    var selectedIndex = selectedRoles.selectedIndex;
	    if (selectedIndex == -1) return;
	    else selectedRoles.remove(selectedIndex);
	    LoadExistingRoles(ExistingOrgs, ExistingRoles, SelectedRoles, HiddenExistingRoles, Delimiter1, Delimiter2);
	}

	//Loading existing roles when assigning roles to a person.
	function LoadExistingRoles(ExistingOrgs, ExistingRoles, SelectedRoles, HiddenExistingRoles, Delimiter1, Delimiter2) {
	    var existingOrgs = document.getElementById(ExistingOrgs);
	    var existingRoles = document.getElementById(ExistingRoles);
	    var selectedRoles = document.getElementById(SelectedRoles);
	    var hiddenExistingRoles = document.getElementById(HiddenExistingRoles);
	    for (i = (existingRoles.options.length - 1); i >= 0; i--) {
	        existingRoles.options[i] = null;
	    }
	    var split1 = hiddenExistingRoles.value.split(Delimiter1);
	    var foundInSelectedList;
	    for (var i = 0; i < split1.length; i++) {
	        foundInSelectedList = false;
	        var split2 = split1[i].split(Delimiter2);
	        if (split2.length == 2) {
	            for (var j = (selectedRoles.options.length - 1); j >= 0; j--) {
	                if (selectedRoles.options[j].value == (existingOrgs.options[existingOrgs.selectedIndex].value + Delimiter2 + split2[1])) foundInSelectedList = true;
	            }
	            if (!foundInSelectedList) {
	                var tmpText = split2[0];
	                var tmpValue = split2[1];
	                var tmpOption = new Option(tmpText, tmpValue, false, false);
	                existingRoles.options[existingRoles.options.length] = tmpOption;
	            }
	        }
	    }
	    SortField(ExistingRoles);
	}
// JAVASCRIPT LISTBOX SELECTION - END
