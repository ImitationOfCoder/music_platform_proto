build-action:
	@if [ -z "$(package)" ]; then \
		echo "Variable 'package' is empty."; \
		exit 1; \
	fi; \
	protoc \
		--proto_path=./proto \
		--go_out=./gen/go/$(package) \
		--go_opt=paths=source_relative \
		--go-grpc_out=./gen/go/$(package) \
		--go-grpc_opt=paths=source_relative \
		./proto/$(package).proto

build-user:
	@make build-action package=user

build-auth:
	@make build-action package=auth
