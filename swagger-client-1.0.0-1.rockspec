package = "swagger-client"
version = "1.0.0-1"
source = {
	url = "https://github.com/YOUR_GIT_USERNAME/YOUR_GIT_REPO.git"
}

description = {
	summary = "API client genreated by Swagger Codegen",
	detailed = [[
[www.passmeister.com](https://www.passmeister.com).]],
	homepage = "https://github.com/swagger-api/swagger-codegen",
	license = "Unlicense",
	maintainer = "Swagger Codegen contributors",
}

dependencies = {
	"lua >= 5.2",
	"http",
	"dkjson",
	"basexx"
}

build = {
	type = "builtin",
	modules = {
		["swagger-client.api.pass_api"] = "swagger-client/api/pass_api.lua";
	}
}
