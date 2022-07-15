group "default" {
  targets = ["app"]
}

target "app" {
  tags = ["mjason/geo_sync"]
  dockerfile = "Dockerfile"
  platforms = ["linux/amd64", "linux/arm64"]
}