class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/badges"(controller:"badge",action:"list"){
			filter = 'all'
		}

		"/badges/$filter" {
			controller = "badge"
			action = "list"
			constraints {
				filter (inList:['all','earned','unearned','gold','silver','bronze'])
			}
		}

		"/"(controller:"topic", action:"list")
		"/questions"(controller:"topic", action:"list")
		"/users"(controller:"user", action:"list")
		"/unanswered"(controller:"message",action:"list")
		"/tags"(controller:"tag",action:"list")
		//"/"(view:'/index')
   		"404"(view: "errors/notFound")
   		"405"(view: "errors/notAllowed")
		"500"(view:"errors/serverError")
	}
}