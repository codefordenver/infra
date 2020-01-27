(import "ksonnet-util/kausal.libsonnet") +
(import "./config.libsonnet") +
{
  local deployment = $.apps.v1.deployment,
  local container = $.core.v1.container,
  local port = $.core.v1.containerPort,
  local service = $.core.v1.service,

  // alias
  local c = $._config.cfdBlog,

  cfdBlog: {
    deployment: deployment.new(
      name=c.ghost.name,
      replicas=1,
      containers=[
        container.new(c.ghost.name, $._images.cfdBlog.ghost)
        + container.withPorts([port.new("api", c.ghost.port)]),
      ],
    ),
    service: $.util.serviceFor(self.deployment),
  }
}
