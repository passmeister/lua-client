--[[
  Demo Client for Passmeister Apple Wallet and Google Wallet API
 
  [www.passmeister.com](https://www.passmeister.com).
 
  OpenAPI spec version: 1.0.0
  
  Generated by: https://github.com/swagger-api/swagger-codegen.git
]]

--package swagger-client

local http_request = require "http.request"
local http_util = require "http.util"
local dkjson = require "dkjson"
local basexx = require "basexx"

-- model import
local swagger-client_todo_object_mapping = require "swagger-client.model.todo_object_mapping"

local pass_api = {}
local pass_api_mt = {
	__name = "pass_api";
	__index = pass_api;
}

local function new_pass_api(host, basePath, schemes)
	local schemes_map = {}
	for _,v in ipairs(schemes) do
		schemes_map[v] = v
	end
	local default_scheme = schemes_map.https or schemes_map.http
	return setmetatable({
		host = host;
		basePath = basePath or "https://localhost";
		schemes = schemes_map;
		default_scheme = default_scheme;
		http_username = nil;
		http_password = nil;
		api_key = {};
		access_token = nil;
	}, pass_api_mt)
end

function pass_api:create_or_update_pass(pass_type_id, pass_id)
	local req = http_request.new_from_uri({
		scheme = self.default_scheme;
		host = self.host;
		path = string.format("%s/pass?passTypeId=%s&passId=%s",
			self.basePath, http_util.encodeURIComponent(pass_type_id), http_util.encodeURIComponent(pass_id));
	})

	-- set HTTP verb
	req.headers:upsert(":method", "POST")

	-- make the HTTP call
	local headers, stream, errno = req:go()
	if not headers then
		return nil, stream, errno
	end
	local http_status = headers:get(":status")
	if http_status:sub(1,1) == "2" then
		return nil, headers
	else
		local body, err, errno2 = stream:get_body_as_string()
		if not body then
			return nil, err, errno2
		end
		stream:shutdown()
		-- return the error message (http body)
		return nil, http_status, body
	end
end

function pass_api:delete_pass(pass_type_id, pass_id)
	local req = http_request.new_from_uri({
		scheme = self.default_scheme;
		host = self.host;
		path = string.format("%s/pass?passTypeId=%s&passId=%s",
			self.basePath, http_util.encodeURIComponent(pass_type_id), http_util.encodeURIComponent(pass_id));
	})

	-- set HTTP verb
	req.headers:upsert(":method", "DELETE")

	-- make the HTTP call
	local headers, stream, errno = req:go()
	if not headers then
		return nil, stream, errno
	end
	local http_status = headers:get(":status")
	if http_status:sub(1,1) == "2" then
		return nil, headers
	else
		local body, err, errno2 = stream:get_body_as_string()
		if not body then
			return nil, err, errno2
		end
		stream:shutdown()
		-- return the error message (http body)
		return nil, http_status, body
	end
end

function pass_api:get_pass(pass_type_id, pass_id)
	local req = http_request.new_from_uri({
		scheme = self.default_scheme;
		host = self.host;
		path = string.format("%s/pass?passTypeId=%s&passId=%s",
			self.basePath, http_util.encodeURIComponent(pass_type_id), http_util.encodeURIComponent(pass_id));
	})

	-- set HTTP verb
	req.headers:upsert(":method", "GET")

	-- make the HTTP call
	local headers, stream, errno = req:go()
	if not headers then
		return nil, stream, errno
	end
	local http_status = headers:get(":status")
	if http_status:sub(1,1) == "2" then
		return nil, headers
	else
		local body, err, errno2 = stream:get_body_as_string()
		if not body then
			return nil, err, errno2
		end
		stream:shutdown()
		-- return the error message (http body)
		return nil, http_status, body
	end
end

function pass_api:pass_list(pass_type_id, page, limit)
	local req = http_request.new_from_uri({
		scheme = self.default_scheme;
		host = self.host;
		path = string.format("%s/pass/list?passTypeId=%s&page=%s&limit=%s",
			self.basePath, http_util.encodeURIComponent(pass_type_id), http_util.encodeURIComponent(page), http_util.encodeURIComponent(limit));
	})

	-- set HTTP verb
	req.headers:upsert(":method", "GET")

	-- make the HTTP call
	local headers, stream, errno = req:go()
	if not headers then
		return nil, stream, errno
	end
	local http_status = headers:get(":status")
	if http_status:sub(1,1) == "2" then
		return nil, headers
	else
		local body, err, errno2 = stream:get_body_as_string()
		if not body then
			return nil, err, errno2
		end
		stream:shutdown()
		-- return the error message (http body)
		return nil, http_status, body
	end
end

function pass_api:pass_sync(pass_type_id)
	local req = http_request.new_from_uri({
		scheme = self.default_scheme;
		host = self.host;
		path = string.format("%s/pass/sync?passTypeId=%s",
			self.basePath, http_util.encodeURIComponent(pass_type_id));
	})

	-- set HTTP verb
	req.headers:upsert(":method", "POST")

	-- make the HTTP call
	local headers, stream, errno = req:go()
	if not headers then
		return nil, stream, errno
	end
	local http_status = headers:get(":status")
	if http_status:sub(1,1) == "2" then
		return nil, headers
	else
		local body, err, errno2 = stream:get_body_as_string()
		if not body then
			return nil, err, errno2
		end
		stream:shutdown()
		-- return the error message (http body)
		return nil, http_status, body
	end
end

return {
	new = new_pass_api;
}
