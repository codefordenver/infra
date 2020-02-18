{
  _config+:: {
  // define namespace for this library
  cfdBlog: {
    ghost: {
       port: 2368,
       name: "ghost",
       volume: "content",
       mountPath: "/var/lib/ghost/content",
       volumeName: "content",
       volumeSize: "5Gi",
      }
    }
  },
  _images+:: {
    // latest by default
    cfdBlog: {
      ghost: "ghost"
    }
  }
}
