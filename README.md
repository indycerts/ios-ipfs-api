# ios-ipfs-api
A wrapper of the IPFS Client HTTP-API for iOS.

[![CI Status](https://img.shields.io/travis/kjaylee/IpfsApi.svg?style=flat)](https://travis-ci.org/kjaylee/IpfsApi)
[![Version](https://img.shields.io/cocoapods/v/IpfsApi.svg?style=flat)](https://cocoapods.org/pods/IpfsApi)
[![License](https://img.shields.io/cocoapods/l/IpfsApi.svg?style=flat)](https://cocoapods.org/pods/IpfsApi)
[![Platform](https://img.shields.io/cocoapods/p/IpfsApi.svg?style=flat)](https://cocoapods.org/pods/IpfsApi)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```swift
    import Ipfs
    
    .
    .
    .
    
    //Default base address: "http://127.0.0.1:5001/api/v0"
    
    //Do nothing...
    //Or
    Ipfs.shared().setBase(address: "http://your.ipfs.address")
    //Or
    Ipfs.shared().setBase(address: "http://your.ipfs.address", port: 5001)
    //Or
    Ipfs.shared().setBase(address: "http://your.ipfs.address", port: 5001, apiVersionPath: "/api/v0")
    
    .
    .
    .
```

## Requirements

## Installation

IpfsApi is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'IpfsApi'
```


## Test setting.
### Docker usage

An IPFS docker image is hosted at [hub.docker.com/r/ipfs/go-ipfs](https://hub.docker.com/r/ipfs/go-ipfs/).
To make files visible inside the container you need to mount a host directory
with the `-v` option to docker. Choose a directory that you want to use to
import/export files from IPFS. You should also choose a directory to store
IPFS files that will persist when you restart the container.

    export ipfs_staging=</absolute/path/to/somewhere/>
    export ipfs_data=</absolute/path/to/somewhere_else/>

Start a container running ipfs and expose ports 4001, 5001 and 8080:

    docker run -d --name ipfs_host -v $ipfs_staging:/export -v \
        $ipfs_data:/data/ipfs -p 4001:4001 -p 127.0.0.1:8080:8080 \
        -p 127.0.0.1:5001:5001 ipfs/go-ipfs:latest

Watch the ipfs log:

    docker logs -f ipfs_host

Wait for ipfs to start. ipfs is running when you see:

    Gateway (readonly) server
    listening on /ip4/0.0.0.0/tcp/8080

You can now stop watching the log.

Run ipfs commands:

    docker exec ipfs_host ipfs <args...>

For example: connect to peers

    docker exec ipfs_host ipfs swarm peers

Add files:

    cp -r <something> $ipfs_staging
    docker exec ipfs_host ipfs add -r /export/<something>

Stop the running container:

    docker stop ipfs_host


## Author

kjaylee, k.jaylee@gmail.com

## License

IpfsApi is available under the MIT license. See the LICENSE file for more info.
