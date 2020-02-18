(import "ksonnet-util/kausal.libsonnet") +
(import "./config.libsonnet") +
{
  // aliases
  local c = $._config.cfdBlog,
  local deployment = $.apps.v1.deployment,
  local container = $.core.v1.container,
  local port = $.core.v1.containerPort,
  local service = $.core.v1.service,
  local volume = $.core.v1.volume,
  local volumeMount = $.core.v1.volumeMount,

  // volume resource declaration
  local pvc  = {
    apiVersion: "v1",
    kind: "PersistentVolumeClaim",
    metadata: {
      name: "blog-content",
    },
    spec: {
      accessModes: [
        "ReadWriteOnce",
      ],
      resources: {
        requests: {
          storage: c.ghost.volumeSize,
        },
      },
      storageClassName: "do-block-storage",
    },
  },

  cfdBlog: {
    deployment: deployment.new(
      name=c.ghost.name,
      replicas=1,
      containers=[
        container.new(c.ghost.name, $._images.cfdBlog.ghost) +
        container.withPorts([port.new("api", c.ghost.port)]) +
        container.withVolumeMounts([volumeMount.new(c.ghost.volumeName, c.ghost.mountPath)]),
      ],
    ) +
    deployment.mixin.spec.template.spec.withVolumes([{
      name: "content",
      persistentVolumeClaim: {
        claimName: "blog-content",
       }
      },
    ]),
    service: $.util.serviceFor(self.deployment),
    volumes: pvc,
  }
}
