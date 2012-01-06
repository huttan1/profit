function WriteFlash(flashDivID, flashString)
	{
		var flashDiv = document.getElementById(flashDivID);
		if (flashDiv != null)
		{
			flashDiv.innerHTML = flashString;
		}
		return true;
	}