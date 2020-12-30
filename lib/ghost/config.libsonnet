{
  _config+:: {
  // define namespace for this library
  cfdBlog: {
    ghost: {
       port: 2368,
       name: "ghost",
       mountPath: "/var/lib/ghost/content",
       volumeSize: "5Gi",
       volumeName: "ghost-persistent-storage",
       claimName: "pv-claim",
    },
   },
  },
  _images+:: {
    // latest by default
    cfdBlog: {
      ghost: "ghost"
    }
  }
}
