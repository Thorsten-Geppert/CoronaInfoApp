function setInfo(objectLabel, value) {
	if(objectLabel !== undefined && objectLabel !== null) {
		if(value === undefined)
			objectLabel.infoString = "Value is not defined";
		else if(value === null)
			objectLabel.infoString = "Value is null";
		else
			objectLabel.infoString = value;
	}
}

function dateToString(date) {
	return new Date(date).toLocaleDateString(Qt.locale("de_DE"), "dd.MM.yyyy");
}

function numberWithDots(x) {
	return x.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1.')
}

function numberToString(number, round = false) {
	if(round)
		number = Math.round(number * 100) / 100;
	return number.toString().replace(".", ",");
}

function loadData() {
	var req = new XMLHttpRequest();
	req.onreadystatechange = function() {
		if(req.readyState === XMLHttpRequest.DONE) {
			if(req.status === 200) {
				console.log(req.responseText);
				const jsonObject = JSON.parse(req.responseText);

				setInfo(lastUpdatedInfo, dateToString(jsonObject.meta.lastUpdate));
				setInfo(weekIncidenceInfo, numberToString(jsonObject.weekIncidence, true));
				setInfo(deltaCasesInfo, numberWithDots(jsonObject.delta.cases));
				setInfo(casesInfo, numberWithDots(jsonObject.cases));
				setInfo(deltaDeathsInfo, numberWithDots(jsonObject.delta.deaths));
				setInfo(deathsInfo, numberWithDots(jsonObject.deaths));
				setInfo(deltaRecoveredInfo, numberWithDots(jsonObject.delta.recovered));
				setInfo(recoveredInfo, numberWithDots(jsonObject.recovered));
				setInfo(casesPer100kInfo, numberWithDots(numberToString(jsonObject.casesPer100k, true)));
				setInfo(casesPerWeekInfo, numberWithDots(numberToString(jsonObject.casesPerWeek, true)));
				setInfo(rValueInfo, numberToString(jsonObject.r.value));
				setInfo(rLastUpdateInfo, dateToString(jsonObject.r.lastUpdate));
				setInfo(rValue4DaysValueInfo, numberToString(jsonObject.r.rValue4Days.value));
				setInfo(rValue4DaysDateInfo, dateToString(jsonObject.r.rValue4Days.date));
				setInfo(rValue7DaysValueInfo, numberToString(jsonObject.r.rValue7Days.value));
				setInfo(rValue7DaysDateInfo, dateToString(jsonObject.r.rValue7Days.date));
				setInfo(metaSourceInfo, jsonObject.meta.source);
				setInfo(metaContactInfo, jsonObject.meta.contact);
				setInfo(metaInfoInfo, jsonObject.meta.info);
				setInfo(metaLastUpdateInfo, dateToString(jsonObject.meta.lastUpdate));
				setInfo(metaLastCheckedForUpdateInfo, dateToString(jsonObject.meta.lastCheckedForUpdate));
			} else {
				errorPopup.visible = true;
			}
		}
	}
	req.open("GET", "https://api.corona-zahlen.org/germany");
	req.send();
}
