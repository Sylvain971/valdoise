require 'nokogiri'
require 'open-uri'

#Je crée une méthode pour récupérer l'adresse email d'une seule mairie via sa page dédiée.  
def get_the_email_of_a_townhall_from_its_webpage
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))

	#J'ai regardé le code source et cherché à identifier le plus précisément possible l'élément qui contient l'adresse email. Il s'agit d'un p, dont la classe est "Style 22" situé à la 11ème position. J'ai demandé à la fonction d'aller me chercher précisément cet élément. Je l'enregistre dans la variable email_vaureal. Je convertis en texte pour ne pas récupérer les balises
	email_vaureal = doc.css('p[class = "Style22"]')[11].text
	puts email_vaureal
end

get_the_email_of_a_townhall_from_its_webpage


#Je crée une méthode pour récupérer les url de toutes les mairies du Val d'Oise.
def get_all_the_urls_of_val_doise_townhalls
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	#Je crée un array pour stocker les urls que je vais collecter. 
	$list_of_url_1 = []

	#J'applique le même raisonnement que précédemment, j'identifie l'élément qui contient les url : l'élément a et sa classe lientxt pour le sélectionner. 
	doc.css("a[class = 'lientxt']").each do |url|
		#Pour chacun, j'enregistre le href dans le tableau créé à cet effet.
		$list_of_url_1 << url["href"]
	end
		puts $list_of_url_1
end	

get_all_the_urls_of_val_doise_townhalls




