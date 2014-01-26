class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/questions"(controller:"topic", action:"list")
		"/users"(controller:"user", action:"list")
		"/unanswered"(controller:"message",action:"list")
		"/tags"(controller:"tag",action:"list")
		"/"(controller:"topic", action:"list") // pour le moment
		//"/"(view:'/index')
		"500"(view:'/error')
	}
}
