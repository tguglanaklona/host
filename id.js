function ind(i){
	if(i){
		var v = parseInt(i);
		if(!isNaN(v)){
			if ((v>=1)&&(v<=137)){
				return document.getElementsByTagName('a')[v].href;
			}
		}
	}
}
